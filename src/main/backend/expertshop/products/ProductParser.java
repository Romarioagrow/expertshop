package expertshop.products;

import com.opencsv.CSVReader;
import expertshop.domain.BrandProduct;
import expertshop.domain.Product;
import expertshop.domain.ProductBase;
import expertshop.repos.BaseRepo;
import expertshop.repos.BrandRepo;
import expertshop.repos.ProductRepo;
import expertshop.services.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jsoup.Connection;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.net.ConnectException;
import java.net.MalformedURLException;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;

@Log
@Service
@AllArgsConstructor
public class ProductParser {
    private final ProductService productService;
    private final ProductRepo productRepo;
    private final BrandRepo brandRepo;
    private final BaseRepo baseRepo;

    public void
    parseProducts(MultipartFile file)
    {
        if (file != null && !Objects.requireNonNull(file.getOriginalFilename()).isEmpty())
        {
            log.info("Парсинг " + file.getOriginalFilename());
            try
            {
                File excelFile = new File("C:\\Users\\R\\Desktop\\Prices\\"+file.getOriginalFilename());
                FileInputStream inputStream = new FileInputStream(excelFile);

                if (fileRBT(file)) parseRBT(inputStream);
                else               parseRUSBT(inputStream);
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

    private void parseRBT(FileInputStream inputStream) throws IOException {
        int countAdd = 0, countUpdate = 0;

        HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
        HSSFSheet sheet = workbook.getSheetAt(0);

        for (Row row : sheet)
        {
            if (lineIsCorrect(row))
            {
                String productID = row.getCell(0).toString();
                if (productExists(productID))
                {
                    updateProduct(row, productID);
                    countUpdate++;
                }
                else
                {
                    createProductRBT(row);
                    countAdd++;
                }
            }
        }
        workbook.close();
        inputStream.close();
        log.info("Товаров добавлено: "   + countAdd);
        log.info("Товаров обновлено: "   + countUpdate);
    }

    private void parseRUSBT(FileInputStream inputStream) throws IOException
    {
        int countAdd = 0, countUpdate = 0;

        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        XSSFSheet sheet = workbook.getSheetAt(0);

        for (Row row : sheet)
        {
            if (lineIsCorrectR(row))
            {
                String productID = row.getCell(5).toString().replaceAll("\\\\", "_");
                if (productExists(productID))
                {
                    updateProduct(row, productID);
                    countUpdate++;
                }
                else
                {
                    createProductRUSBT(row);
                    countAdd++;
                }
            }
        }
        workbook.close();
        inputStream.close();
        log.info("Товаров добавлено: "   + countAdd);
        log.info("Товаров обновлено: "   + countUpdate);
    }

    private void updateProduct(Row row, String productID) {
        Product product = productRepo.findByProductID(productID);

        if (product.getProductGroup() != null)
        {
            String productAmount, productPrice;
            if (product.getSupplier().equals("1RBT"))
            {
                productAmount   = row.getCell(6).toString();
                productPrice    = row.getCell(7).toString();
            }
            else
            {
                productAmount   = row.getCell(7).toString().concat(row.getCell(8).toString());
                productPrice    = row.getCell(13).toString();
            }
            try
            {
                if (ignoreUpdate(product))
                {
                    product.setUpdate(LocalDate.now());
                    product.setIsAvailable(true);
                    product.setOriginalPrice(productPrice);
                    product.setOriginalAmount(productAmount);
                    productRepo.save(product);
                    return;
                }

                product.setOriginalAmount(productAmount);
                product.setOriginalPrice(productPrice);
                product.setIsAvailable(true);

                int finalPrice   = roundPrice(product.getDefaultCoefficient(), (int) Double.parseDouble(StringUtils.deleteWhitespace(product.getOriginalPrice().replaceAll(",","."))));
                int productBonus = matchBonus(finalPrice);
                product.setFinalPrice(finalPrice);
                product.setBonus(productBonus);
            }
            catch (NullPointerException e) {
                log.info(e.getClass().getName());
                e.printStackTrace();
            }
        }
        product.setUpdate(LocalDate.now());
        productRepo.save(product);
    }

    private void createProductRBT(Row row)
    {
        try {
            Product product = new Product();
            product.setProductID(row.getCell(0).toString());
            product.setOriginalCategory(row.getCell(1).toString());
            product.setOriginalType(row.getCell(2).toString());
            product.setOriginalBrand(row.getCell(4).toString());
            product.setOriginalName(row.getCell(3).getStringCellValue());
            product.setOriginalAnnotation(row.getCell(5).toString());
            product.setOriginalAmount(row.getCell(6).toString());
            product.setOriginalPrice(row.getCell(7).toString().trim());
            product.setOriginalPic(StringUtils.substringBetween(row.getCell(3).toString(), "\"", "\""));
            product.setSupplier("1RBT");
            product.setUpdate(LocalDate.now());
            product.setIsAvailable(true);
            productRepo.save(product);
        }
        catch (Exception e) {
            log.warning(e.getClass().getName());
        }
    }
    private void createProductRUSBT(Row row)
    {
        try {
            Product product = new Product();
            product.setProductID(row.getCell(5).toString().replaceAll("\\\\", "_"));
            product.setOriginalCategory(row.getCell(0).toString().concat("; ").concat(row.getCell(1).toString()));
            product.setOriginalType(row.getCell(3).toString());
            product.setOriginalBrand(row.getCell(4).toString());
            product.setOriginalName(row.getCell(6).toString());
            product.setOriginalAmount(row.getCell(7).toString() + row.getCell(8).toString());
            product.setOriginalPrice(row.getCell(13).toString());
            product.setLinkR(row.getCell(15).getHyperlink().getAddress());
            product.setRType(row.getCell(3).toString());
            product.setRName(row.getCell(6).toString());
            product.setSupplier("2RUS-BT");
            product.setUpdate(LocalDate.now());
            product.setIsAvailable(true);
            productRepo.save(product);
        }
        catch (NullPointerException ignored) {
        }
    }

    private boolean ignoreUpdate(Product product) {
        String brand = product.getOriginalBrand();
        return  StringUtils.equalsIgnoreCase(brand, "AMCV")     ||
                StringUtils.equalsIgnoreCase(brand, "ARDIN")    ||
                StringUtils.equalsIgnoreCase(brand, "BINATONE") ||
                StringUtils.equalsIgnoreCase(brand, "DOFFLER")  ||
                StringUtils.equalsIgnoreCase(brand, "LERAN")    ||
                StringUtils.equalsIgnoreCase(brand, "SENTORE")  ||
                product.getPriceMod()       != null             ||
                product.getCoefficientMod() != null;
    }

    private int roundPrice(double coefficient, int price) {
        int finalPrice = (int) (price * coefficient);
        String val = String.valueOf(finalPrice);

        if (finalPrice > 0 && finalPrice <= 10) {
            return 10;
        }
        else if (finalPrice > 10 && finalPrice < 1000) {
            val = val.substring(0, val.length()-1).concat("9");
            return Integer.parseInt(val);
        }
        else if (finalPrice > 1000) {
            val = val.substring(0, val.length()-2).concat("90");
            return Integer.parseInt(val);
        }
        else return finalPrice;
    }
    private Integer matchBonus(int price) {
        int bonus = price * 3 / 100;
        String val = String.valueOf(bonus);

        if (bonus > 0 && bonus <= 10) {
            return 10;
        }
        else {
            val = val.substring(0, val.length()-1).concat("0");
            return Integer.parseInt(val);
        }
    }

    private boolean lineIsCorrectR(Row row) throws NullPointerException {
        return row.getCell(0) != null && !row.getCell(0).getStringCellValue().isEmpty() && !row.getCell(0).getStringCellValue().isEmpty() && !row.getCell(0).getStringCellValue().contains("Уценка") && !row.getCell(0).getStringCellValue().contains("УЦЕНКА") && !row.getCell(0).getStringCellValue().contains("Группа 1");
    }

    private boolean productExists(String productID) {
        return productRepo.findByProductID(productID) != null;
    }

    private boolean differentParams(String productID, String amount, String price) {
        Product product = productRepo.findByProductID(productID);
        return !product.getOriginalAmount().equals(amount) || !product.getOriginalPrice().equals(price);
    }

    private boolean fileRBT(MultipartFile file) {
        return Objects.requireNonNull(file.getOriginalFilename()).contains("СП2");
    }


    private boolean lineIsCorrect(Row line) {
        return !line.getCell(0).toString().isEmpty() && !line.getCell(0).toString().contains("8(351) 239 39 10(11)") && !line.getCell(0).toString().startsWith(".") && !line.getCell(0).toString().startsWith("г. Челябинск") && !line.getCell(0).toString().startsWith("Код товара");
    }

    public void parseBrandProducts(MultipartFile file) {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(file.getInputStream()));
            CSVReader reader = new CSVReader(bufferedReader, ';');

            String[] line;
            int count = 0;
            while ((line = reader.readNext()) != null) {
                if (!line[0].isEmpty()/* && !line[0].startsWith("ПРАЙС") && !line[0].contains("г. Челябинск") && !line[0].startsWith("Код товара")*/)
                {
                    BrandProduct brandProduct;
                    brandProduct = brandRepo.findByProductID(line[0]);

                    if (brandProduct == null) {
                        brandProduct = new BrandProduct();
                        brandProduct.setProductID(line[0]);
                    }

                    //BrandProduct brandProduct = new BrandProduct();
                    brandProduct.setFullName(line[1]);
                    brandProduct.setBrand(line[2]);
                    brandProduct.setAnnotation(line[3]);
                    brandProduct.setOriginalPrice(line[4]);
                    brandProduct.setFinalPrice(line[5]);
                    brandProduct.setPercent(line[6]);
                    if (!line[9].startsWith("В ячейке")) {
                        brandProduct.setPic(line[9]);
                    }

                    String shortModel = StringUtils.substringAfter(brandProduct.getFullName().toLowerCase(), brandProduct.getBrand().toLowerCase()).replaceAll(" ", "").toLowerCase();
                    shortModel = brandProduct.getBrand().toLowerCase().concat(shortModel).replaceAll("\\W", "");
                    brandProduct.setShortModel(shortModel);

                    brandRepo.save(brandProduct);
                    System.out.println();
                    log.info(brandProduct.getFullName());
                    log.info(brandProduct.getShortModel());
                }
            }
        }
        catch (IOException | ArrayIndexOutOfBoundsException exp) {
            exp.getStackTrace();
        }
    }

    private void setAvailable() {
        productRepo.findAllByProductGroupIsNotNull().forEach(product -> {product.setIsAvailable(false); productRepo.save(product);});
        for (Product product : productRepo.findAllByProductGroupIsNotNull()) {
            if (product.getUpdate().toString().equals(LocalDate.now().toString())) {
                product.setIsAvailable(true);
            }
            else product.setIsAvailable(false);
            productRepo.save(product);
        }
    }

    public void parseBase(MultipartFile file) {
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(file.getInputStream()));
            CSVReader reader = new CSVReader(bufferedReader, ';');

            String[] line;
            int count = 0;
            while ((line = reader.readNext()) != null) {
                if (line[0].equals("Категория")) log.info("!!! Пропуск первой строки");
                else
                {
                    ProductBase product = new ProductBase();
                    product.setProductID(UUID.randomUUID().toString());

                    if (Objects.requireNonNull(file.getOriginalFilename()).contains("Компьютерная техника")) {
                        product.setFullName(line[5]);
                        product.setAnnotation(line[11]);
                        product.setBrand(line[13]);
                        product.setPics(line[19]);
                        product.setFormattedAnnotation(line[20]);
                    }
                    else  {
                        product.setFullName(line[6]);
                        product.setAnnotation(line[11]);
                        product.setBrand(line[14]);
                        product.setPics(line[20]);
                        product.setFormattedAnnotation(line[21]);
                    }
                    baseRepo.save(product);
                    log.info(product.getFullName());
                    count++;
                }
            }
            log.info("Products add: " + count);
        }
        catch (IOException | ArrayIndexOutOfBoundsException exp) {
            //log.info("Something went wrong with Base!");
            exp.getStackTrace();
        }
    }

    public void parseRusBT() {
        productRepo.findBySupplier("2RUS-BT").forEach(product -> {
            if (product.getLinkR() != null && (product.getLinkR().contains("В ячейке нет гиперссылки!") || product.getLinkR().contains("#ИМЯ?"))) {
                product.setLinkR(null);
                productRepo.save(product);
            }
        });

        findInBigBase();

        AtomicInteger count404 = new AtomicInteger(), countPic = new AtomicInteger(), countAnno = new AtomicInteger(), countInfo = new AtomicInteger();
        List<Product> list = productRepo.findBySupplierAndProductGroupIsNotNullAndOriginalPicIsNullAndLinkRIsNotNull("2RUS-BT");
        System.out.println();
        log.info("Парсинг сайта картинок RUS...");
        log.info("Всего товаров без картинок для парсинга: " + list.size());

        list.forEach(product ->
        {
            String link = product.getLinkR();
            try
            {
                if (!link.isEmpty() && !link.startsWith("http://magazilla")) ///!
                {
                    String pic;
                    Document page = Jsoup.connect(link).get();
                    if (product.getOriginalPic() == null)
                    {
                        Elements pics = page.select("img");
                        for (Element picElement : pics)
                        {
                            String picSrc = picElement.attr("src");
                            if (picSrc.startsWith("/upload"))
                            {
                                pic = "http://rusbt.ru".concat(picSrc);
                                if (product.getOriginalPic() == null) product.setOriginalPic(pic);
                                else {
                                    if (product.getPics() == null) product.setPics(pic);
                                    //else product.setPics(product.getPics().concat(";").concat(pic));
                                }

                                productRepo.save(product);
                                log.info("Изображения для: " + product.getOriginalName() + ": " + pic);
                                countPic.getAndIncrement();
                            }
                            else log.info("Нет изображения товара на сайте!");
                        }
                    }

                    if (product.getFormattedAnnotation() == null || product.getFormattedAnnotation().isEmpty())
                    {
                        Elements props = page.getElementsByClass("one_prop");
                        for (Element element : props) {
                            String key = StringUtils.substringBetween(element.html(), "<span>", "</span>");
                            String val = StringUtils.substringBetween(element.html(), "<div class=\"left_value\">", "</div>");
                            String param = key.concat(":").concat(val).concat(";");

                            if (product.getFormattedAnnotation() == null || product.getFormattedAnnotation().isEmpty()) {
                                product.setFormattedAnnotation(param);
                            }
                            else product.setFormattedAnnotation(product.getFormattedAnnotation().concat(param));
                        }
                    }
                    /*if (product.getDescription() == null){
                        Elements description = page.getElementsByClass("bx_item_description");
                        for (Element el : description) {
                            product.setDescription(el.html());
                        }
                    }*/
                    productRepo.save(product);
                }
                else log.info("Ссылка отсутствует!");
                System.out.println();
                countInfo.getAndIncrement();
                log.info(countInfo + " из " + list.size());
            }
            catch (HttpStatusException exp) {
                log.info("404 Page is empty");
                count404.getAndIncrement();
            }
            catch (ConnectException exp) {
                log.info("Connection timed out");
                exp.printStackTrace();
            }
            catch (MalformedURLException exp) {
                log.info(exp.getClass().getName());
            }
            catch (IOException | NullPointerException exp) {
                log.info("Exception");
                ///exp.printStackTrace();
            }
        });

        //downloadPics();
        System.out.println();
        log.info("Всего товаров: "      + list.size());
        log.info("Успешно скачано: "    + countPic);
        log.info("404 на сайте: "       + count404);
    }

    public void downloadPics() {
        List<Product> list = productRepo.findAllByProductGroupNotNullAndOriginalPicNotNull();
        list.forEach(product ->
        {
            try {
                String link = product.getOriginalPic();
                if (!link.isEmpty()) {
                    if (product.getLocalPic() == null)
                    {
                        File file = new File("C:\\expertshopLOCAL\\src\\main\\frontend\\static\\img\\products\\" + link.replaceAll("\\W", "").concat(".jpg"));

                        HashMap<String, String> map = new HashMap<>();
                        Connection.Response resultImageResponse = Jsoup.connect(link).cookies(map).ignoreContentType(true).execute();

                        if (!file.exists())
                        {
                            FileOutputStream out = (new FileOutputStream(file.getAbsoluteFile().toString()));
                            out.write(resultImageResponse.bodyAsBytes());  /// resultImageResponse.body() image content
                            out.close();
                        }

                        String localPath = StringUtils.substringAfterLast(file.getPath(), "\\");
                        String localPic  = "/../img/products/".concat(localPath);
                        product.setLocalPic(localPic);
                        productRepo.save(product);
                        log.info(product.getLocalPic());
                        //product.setLocalPic(file.getAbsolutePath());
                        //
                        //log.info(product.getLocalPic());

                        //log.info(file.getCanonicalPath());
                        //log.info(file.get());
                    }
                }
            }
            catch (HttpStatusException exp) {
                log.info("404 Page is empty");
            }
            catch (ConnectException exp) {
                log.info("Connection timed out");
                exp.printStackTrace();
            }
            catch (MalformedURLException exp) {
                log.info(exp.getClass().getName());
            }
            catch (NullPointerException | IOException e){
                e.printStackTrace();
            }
        });

    }

    public void findInBigBase() {
        log.info("Поиск совпадений в Большой Базе...");

        List<Product> products = productRepo.findAllByModelNameNotNullAndOriginalPicIsNull();
        AtomicInteger count = new AtomicInteger();
        products.forEach(product ->
        {
            //if (product.getPics() == null)
            {
                ProductBase productBase = baseRepo.findFirstByShortModelEquals(product.getShortModel());
                if (productBase != null)
                {
                    System.out.println();
                    log.info("Для: " + product.getFullName());
                    log.info("Нашлось: " + productBase.getFullName());

                    if (product.getFullAnnotation() == null) product.setFullAnnotation(productBase.getAnnotation());
                    if (product.getPics() == null) product.setPics(product.getPics());
                    product.setFormattedAnnotation(productBase.getFormattedAnnotation());

                    if (product.getOriginalPic() == null) {
                        String pic = StringUtils.substringBefore(productBase.getPics(), " ");
                        product.setOriginalPic(pic);
                    }
                    productRepo.save(product);
                    count.getAndIncrement();
                }
            }
        });
        log.info("Всего: " + count.toString());
    }



    ///!!!
    /*
    private String findPicAndParse(String requestName) throws IOException
    {
        log.info(requestName);
        if (!requestName.isEmpty())
        {
            Document page = Jsoup.connect(requestName).get();
            Elements elements = page.select("img");
            //Elements elements = page.getElementsByAttribute("img");
            //Elements elements = page.getElementsByClass("mimg");
            //Elements elements = page.getAllElements();
            for (Element element : elements) {
                log.info(element.toString());
            }
            //Element pic = page.select("class=\"serp-item__thumb justifier__thumb\"").first();
            //log.info(pics.toString());
        }
        return pic.toString();
    }*/

    /*public void countPics()
    {
        List<Product> products = productRepo.findAll();
        int totalPics = 0, picsFromSite = 0;

        for (Product product : products)
        {
            if (!product.getPic().equals("no pic"))
            {
                totalPics++;
                if (product.getPic().contains("top-tehnica.ru"))
                {
                    picsFromSite++;
                }
            }
        }
        log.info("Total pics: " + totalPics);
        log.info("Pics from site: " + picsFromSite);
    }*/

    /*public void checkProductPics()
    {
        String request = "телевизоры";
        //Set<Product> products = productRepo.findProductsByProductGroupContainingIgnoreCaseOrTypeContainingIgnoreCaseOrFullNameContainingIgnoreCase(request, request, request);
        List<Product> products = productRepo.findAll();
        int count = 0;

        for (Product product : products)
        {
            if (checkForParse(product))
            {
                String model = product.getModelName();//.replaceAll(" ", "-");
                String parseSearchRequest = "https://top-tehnica.ru/search?q=".concat(model.substring(0, model.length() - 3)); ///СТРОГАЯ ЛОГИКА ПОИСКА
                log.info("request " + parseSearchRequest);

                try {
                    Document page = Jsoup.connect(parseSearchRequest).get();
                    Elements links = page.select("a");

                    for (Element linkAttr : links)
                    {
                        String link = linkAttr.attr("href");
                        //log.info(link);

                        if (link.contains("https://top-tehnica.ru//catalog"))
                        {
                            System.out.println("\n");
                            log.info("Ссылка на товар " + link);
                            count++;

                            Document productPage = Jsoup.connect(link).get();
                            Elements pics = productPage.select("img"); ///УТОЧНИТЬ

                            for (Element pic : pics)
                            {
                                String picSrc = pic.attr("src");

                                if (picSrc.contains("image.webp") && product.getPic().equals("no pic"))
                                {
                                    product.setPic("https://top-tehnica.ru/".concat(picSrc));
                                    productRepo.save(product);
                                    log.info("Основная картинка для " + model + ":" + picSrc);
                                }
                                else if (picSrc.contains("/img/product"))
                                {
                                    String fullLink = "https://top-tehnica.ru/".concat(picSrc);

                                    String anotherPic = (product.getPics() == null) ? "" : product.getPics(); ///IF
                                    anotherPic = anotherPic.concat(" ").concat(fullLink);

                                    product.setPics(anotherPic);
                                    productRepo.save(product);
                                    log.info("Ссылка на картинку для " + model + ":" + picSrc);
                                }
                            }

                            if (product.getShortHtmlInfo() == null)
                            {
                                Elements params = productPage.getElementsByClass("n-product-spec-list");
                                for (Element param : params)
                                {
                                    String li = param.html();
                                    product.setShortHtmlInfo(li);
                                    productRepo.save(product);
                                    log.info("Short Info for " + product.getModelName());
                                }
                            }

                            if (product.getFullInfo() == null)
                            {
                                Document productParamsPage = Jsoup.connect(link.concat("/harakteristiki")).get();
                                Elements tab = productParamsPage.getElementsByClass("product-options-table");
                                for (Element element : tab)
                                {
                                    String table = element.html();
                                    product.setFullInfo(table);
                                    productRepo.save(product);
                                    log.info("Full Info for " + product.getModelName());
                                }
                            }
                        }
                    }
                }
                catch (IOException e) {///
                    e.getStackTrace();
                }
            }
            else log.info("Not required for product " + product.getModelName());
        }
        log.info("END OF SEQUENCE! " + count + " Products parsed!");
    }*/

    /*private boolean checkForParse(Product product) {
        return product.getPic().equals("no pic") || product.getShortHtmlInfo() == null || product.getFullInfo() == null;
    }*/

    /*private void resolvePics()
    {
        List<Product> products = productRepo.findAll();
        List<ProductBase> productsBase = baseRepo.findAll();

        for (Product product : products)
        {
            if (product.getPic() == null)
            {
                ProductBase productBase = baseRepo.findFirstByModelNameContaining(product.getModelName());

                if (productBase != null)
                {
                    product.setPic(productBase.getPics());
                    productRepo.save(product);
                    log.info(product.getModelName() + " URL: " + product.getPic());
                }
            }
        }

        *//*for (ProductBase productBase : productsBase)
        {
            Product product = productRepo.findFirstByModelNameContaining(productBase.getModelName());

            if (product != null && product.getPic() == null)
            {
                product.setPic(productBase.getPics());
                productRepo.save(product);
                log.info(product.getModelName() + " URL: " + product.getPic());
            }
        }*//*

        int count = 0;
        for (Product product : products)
        {
            if (product.getPic() != null) count++;
        }

        log.info("PICS SET: " + count + " from " + products.size());
    }*/
}
