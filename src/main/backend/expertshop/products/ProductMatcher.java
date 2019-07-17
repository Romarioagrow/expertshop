package expertshop.products;

import expertshop.domain.Product;
import expertshop.repos.ProductRepo;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Log
@Service
@AllArgsConstructor
public class ProductMatcher {
    private final ProductRepo productRepo;
    static int matchCounter = 0;

    public void matchProducts()
    {
        List<Product> products = productRepo.findAll();

        for (Product product : products)
        {
            try
            {
                if (productValidToMatch(product))
                {
                    /*АВТОТОВАРЫ*/
                    matchProduct("10.01, Акустика"									                                , "Автоакустика"						,1.18	            , "Автоакустика"						, "Автотовары"					, product);
                    matchProduct("10.02, Автомагнитолы"											                , "Автомагнитолы"						,1.18	            , "Автомагнитола"						, "Автотовары"					, product);
                    matchProduct("15.10.04.03, Видеорегистраторы"									                , "Видеорегистраторы"					,1.25	            , "Видеорегистратор"					, "Автотовары"					, product);
                    matchProduct("15.10.04.01"													                    , "Радар детекторы"						,1.18	            , "Радар детектор"					, "Автотовары"					, product);

                    /*ИНСТРУМЕНТЫ ДЛЯ ДОМА*/
                    /// ПЕРЕРАСПРЕДЕЛИТЬ ГРУППЫ ДРЕЛИ БОЛЬШИЕ - ШУРУПОВЕРТЫ
                    matchProduct("06.01.01, 06.01.02, 06.01.03, 06.01.05, Шуруповерты"				                , "Шуруповерты/Дрели"					,1.16	            , "Дрель-Шуруповерт"					, "Инструменты для дома"		    , product);
                    matchProduct("06.02, Шлифовальные машины"										                , "Шлифовальные машины"					,1.16	            , "Шлифовальная машина"				, "Инструменты для дома"		    , product);
                    matchProduct("06.06.08, Сварочные аппараты"									                , "Сварочное оборудование"				,1.16	            , "Сварочный аппарат"					, "Инструменты для дома"		    , product);
                    matchProduct("06.01.06, Перфораторы"											                , "Перфораторы"							,1.16	            , "Перфоратор"						, "Инструменты для дома"		    , product);
                    matchProduct("06.03, Пила электрическая"														, "Электропилы"							,1.16	            , "Электропила"						, "Инструменты для дома"		    , product);

                    /*ПРИБОРЫ ПЕРСОНАЛЬНОГО УХОДА*/
                    //15.05.01.05 Бритвенные станки!(1.5)
                    matchProduct("05.10.01, Весы напольные"										                , "Напольные весы"						,1.22	            , "Напольные весы"					, "Приборы персонального ухода"	, product);
                    matchProduct("05.02.03, Наборы и стайлеры"												        , "Стайлеры"							,1.22	            , "Стайлер"							, "Приборы персонального ухода"	, product);
                    matchProduct("05.01.01, Фен"													                , "Фены"								,1.22	            , "Фен"								, "Приборы персонального ухода"	, product);
                    matchProduct("15.05.01.05, 05.06, 05.07, Бритвенные станки, Бритвы"					        , "Станки для бритья"					,1.22	            , "Бритва"							, "Приборы персонального ухода"	, product);
                    matchProduct("05.02.02, Щипцы для выпрямления"									                , "Щипцы для волос"						,1.22	            , "Бритвенный станок"					, "Приборы персонального ухода"	, product);
                    matchProduct("05.03.02, Триммеры для лица "									                , "Триммеры для бритья"					,1.22	            , "Триммер"							, "Приборы персонального ухода"	, product);
                    matchProduct("05.07, Эпиляторы"											                    , "Эпиляторы"							,1.22	            , "Эпиляторы"							, "Приборы персонального ухода"	, product);
                    matchProduct("05.08"															                , "Массажеры"							,1.22	            , "Массажер"							, "Приборы персонального ухода"	, product);
                    matchProduct("05.11, Маникюрные наборы"														, "Маникюрные наборы"					,1.22              , "Маникюрный набор"					, "Приборы персонального ухода"	, product);
                    matchProduct("Машинки для стрижки"															    , "Машинки для стрижки"					,1.22              , "Машинка для стрижки"				, "Приборы персонального ухода"	, product);
                    matchProduct("Плойки"															                , "Плойки"					            ,1.22              , "Плойка"					            , "Приборы персонального ухода"	, product);

                    /*КЛИМАТИЧЕСКАЯ ТЕХНИКА*/
                    matchProduct("04.01, Кондиционеры"											                    , "Кондиционеры"						,1.15	            , "Кондиционер"						, "Климатическая техника"		    , product);
                    matchProduct("04.05, Водонагреватели"											                , "Водонагреватели"						,1.20	            , "Водонагреватель"					, "Климатическая техника"		    , product);
                    ////+
                    matchProduct("04.04.01, Увлажнители"											                , "Увлажнители воздуха"					,1.20	            , "Увлажнитель воздуха"				, "Климатическая техника"		    , product);
                    matchProduct("04.02, Конвектор, Обогреватель, Тепловая пушка, Тепловентилятор"					, "Обогреватели"						,1.20	            , "Обогреватель"						, "Климатическая техника"		    , product);
                    matchProduct("04.03, Вентиляторы"												                , "Вентиляторы"							,1.20	            , "Вентилятор"						, "Климатическая техника"		    , product);
                    ////+
                    matchProduct("04.04.03, Мойки воздуха"										                    , "Очистители воздуха"					,1.20	            , "Очиститель воздуха"				, "Климатическая техника"		    , product);

                    /*КОМПЬЮТЕРЫ И ОРГТЕХНИКА*/
                    //Моноблоки!
                    matchProduct("08.03, Ноутбуки"															        , "Ноутбуки"							,1.17	            , "Ноутбук" 							, "Компьютеры и оргтехника"		, product);
                    matchProduct("08.05, МФУ"														                , "Принтеры"							,1.17	            , "Принтер"							, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.08.36, Клавиатура"											                , "Клавиатуры"							,1.30	            , "Клавиатуры"						, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.08.37, Мышь"													                , "Мыши"								,1.30	            , "Мышь"								, "Компьютеры и оргтехника"		, product);
                    matchProduct("08.04, Мониторы"												                    , "Мониторы"							,1.17	            , "Монитор"							, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.08.18, Флеш"													                , "Flash карты"							,1.40	            , "Flash карта"						, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.02.04, Сетевые фильтры"										                , "Сетевые фильтры"						,2	                , "Сетевой шнур"						, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.08.29"														                , "Роутеры и сетевое оборудование"		,1.20	            , "Роутер"							, "Компьютеры и оргтехника"		, product);
                    matchProduct("15.08.02.04"											 		                    , "Внешние жесткие диски"				,1.18	            , "Внешний жесткий диск"				, "Компьютеры и оргтехника"		, product);
                    matchProduct("08.01"														                    , "Готовые ПК"							,1.17	            , "Готовый ПК"						, "Компьютеры и оргтехника"		, product);

                    /*ЦИФРОВЫЕ УСТРОЙСТВА*/
                    //Планшеты Apple!
                    matchProduct("09.06.01, 09.06.02, 09.06.03, 09.06.04, Фотоаппараты"			                , "Фотоаппараты"						,1.17				, "Фотоаппарат"						, "Цифровые устройства"			, product);
                    matchProduct("09.01.02, Смартфоны"											                    , "Смартфоны"							,1.13				, "Смартфон"							, "Цифровые устройства"			, product);
                    matchProduct("09.01.01, Сотовые телефоны"										                , "Сотовые телефоны"					,1.18				, "Сотовый телефон"					, "Цифровые устройства"			, product);
                    matchProduct("08.02, Планшеты"												                    , "Планшеты"							,1.17				, "Планшет"							, "Цифровые устройства"			, product);
                    matchProduct("15.08.33, 15.08.34, 15.16, Наушники"							                    , "Наушники и гарнитуры"				,1.30				, "Наушники"							, "Цифровые устройства"			, product);
                    matchProduct("15.09.03.02, Внешние аккумуляторы"								                , "Внешние аккумуляторы"				,1.18				, "Внешний аккумулятор"				, "Цифровые устройства"			, product);
                    matchProduct("15.09.03.01 Чехлы для телефонов"								                    , "Чехлы для телефонов"					,1.18				, "Чехол для телефона"				, "Цифровые устройства"			, product);
                    matchProduct("09.02"															                , "Видеокамеры"							,1.13				, "Видеокамера"						, "Цифровые устройства"			, product);
                    matchProduct("09.08"															                , "Электронные книги"					,1.17				, "Электронная книга"					, "Цифровые устройства"			, product);
                    matchProduct("15.09.05, 15.24.02.10, microSD"									                , "Карты памяти microSD"				,1.40				, "Карта памяти microSD"				, "Цифровые устройства"			, product);
                    matchProduct("09.07.02"													                    , "MP3 плееры"							,1.17				, "MP3 плеер"							, "Цифровые устройства" 		    , product);

                    /*ГАДЖЕТЫ*/
                    //15.25.04.12 B-бренды(1.2)!
                    matchProduct("15.25.01, Умные спортивные часы"								                    , "Умные часы"							,1.15	            , "Умные часы"						, "Гаджеты"						, product);
                    matchProduct("15.25.04, Портативная акустика"													, "Bluetooth колонки"					,1.15	            , "Bluetooth колонка"					, "Гаджеты"						, product);
                    matchProduct("15.25.02.02"													                    , "VR системы"							,1.15	            , "VR система"						, "Гаджеты"						, product);


                    /*ТЕХНИКА ДЛЯ ДОМА*/
                    matchProduct("03.01.02, Центрифуги"						                                    , "Центрифуги"		                    ,1.13				, "Центрифуга"					, "Техника для дома"			    , product);
                    matchProduct("03.01, Ст/м."										                            , "Стиральные машины"		            ,1.13				, "Стиральная машина"					, "Техника для дома"			    , product);
                    matchProduct("03.02.01, Пылесосы"												                , "Пылесосы"				            ,1.18				, "Пылесос"							, "Техника для дома" 			    , product);
                    matchProduct("03.03.01, Утюги"												                    , "Утюги"					            ,1.20				, "Утюг"								, "Техника для дома"			    , product);
                    matchProduct("03.07, 03.08, Шв. машины, Оверлоки"									            , "Швейные машины"			            ,1.18				, "Швейная машина"					, "Техника для дома"			    , product);
                    matchProduct("03.03.02, 03.03.03, 03.03.04, Отпариватели, Ручные отпариватели"					, "Пароочистители"			            ,1.20				, "Пароочиститель"						, "Техника для дома"			    , product);

                    /*КУХОННАЯ ТЕХНИКА*/
                    matchProduct("01.01.02, Холод."											                    , "Холодильники"	                    ,1.15				, "Холодильник"						, "Кухонная техника"			    , product);
                    matchProduct("01.01.03, Мороз."											                    , "Морозильники"	                    ,1.15				, "Морозильник"						, "Кухонная техника"			    , product);
                    matchProduct("01.02.01, 01.02.02, Плита эл."						                            , "Электрические плиты"		            ,1.17				, "Эликтрическая плита"				, "Кухонная техника"			    , product);
                    matchProduct("01.02.03, Плитки эл. настольные"						                            , "Электрические плитки"	            ,1.17				, "Эликтрическая плитка"				, "Кухонная техника"			    , product);
                    matchProduct("01.03.04, Плитки газ. настольные"						                        , "Газовые плитки"			            ,1.17			    , "Газовая плитка"				    , "Кухонная техника"			    , product);
                    matchProduct("01.03.01, 01.03.02, Плиты газ/эл. стац."						                    , "Газовые плиты"			            ,1.17				, "Газовая плита"						, "Кухонная техника"			    , product);
                    matchProduct("01.03.03, Комбинированная плита, Плита газ./эл"						            , "Комбинированные плиты"	            ,1.17				, "Комбинированная плита"				, "Кухонная техника"			    , product);
                    matchProduct("01.05, Микр. печи"							                                    , "Микроволновые печи"		            ,1.18				, "Микроволновая печь"				, "Кухонная техника"			    , product);
                    matchProduct("01.18, Чайники эл"							                                    , "Электрические чайники"	            ,1.20				, "Электрический чайник"				, "Кухонная техника"			    , product);
                    matchProduct("01.19, Кофеварки, Кофемолки"												        , "Кофеварки"				            ,1.18				, "Кофеварка"							, "Кухонная техника"			    , product);
                    matchProduct("01.12, Мультиварки"												                , "Мультиварки"				            ,1.20				, "Мультиварка"						, "Кухонная техника"			    , product);
                    matchProduct("01.08.03, 01.08.04, Блендеры"									                , "Блендеры"				            ,1.20				, "Блендер"							, "Кухонная техника"			    , product);
                    matchProduct("01.08.01, 01.08.02, Миксеры"									                    , "Миксеры"					            ,1.20				, "Миксер"							, "Кухонная техника"			    , product);
                    matchProduct("01.10.02, 01.10.01, Мясорубки"									                , "Мясорубки"				            ,1.20				, "Мясорубка"							, "Кухонная техника"			    , product);
                    matchProduct("01.15, Хлебопечи"												                , "Хлебопечи"				            ,1.15				, "Хлебопечь"							, "Кухонная техника"			    , product);
                    matchProduct("15.15.02, Кастрюля"											                    , "Кастрюли"				            ,1.35				, "Кастрюля"							, "Кухонная техника"			    , product);
                    matchProduct("01.04, Посудомоечная машина"									                    , "Посудомоечные машины"	            ,1.15				, "Посудомоечная машина"				, "Кухонная техника"			    , product);
                    matchProduct("07.05.01, 07.05.02, 07.05.03, 07.05.05, 07.05.05, Вытяжка каминная, Вытяжка козырьковая,", "Вытяжки"					    ,1.15              , "Вытяжка"				            , "Кухонная техника"			    , product);
                    matchProduct("01.09, Соковыжималка"				                                            , "Соковыжималки"			            ,1.18		        , "Соковыжималка"				        , "Кухонная техника"			    , product);
                    matchProduct("01.10, Мясорубка"				                                                , "Мясорубки"			                ,1.20		        , "Мясорубка"				            , "Кухонная техника"			    , product);
                    matchProduct("01.12.01"				                                                        , "Фритюрницы"			                ,1.20		        , "Фритюрница"				        , "Кухонная техника"			    , product);
                    matchProduct("01.12.02, Мультиварка"				                                            , "Мультиварки"			                ,1.20		        , "Мультиварка"				        , "Кухонная техника"			    , product);
                    matchProduct("01.13, Пароварки"				                                                , "Пароварки"			                ,1.20		        , "Пароварка"				            , "Кухонная техника"			    , product);
                    matchProduct("01.14.01, Блинница, Вафельница"				                                    , "Электропечи"			                ,1.20		        , "Пароварка"				            , "Кухонная техника"			    , product);
                    matchProduct("01.14.02, Аэрогриль"				                                                , "Аэрогрили"			                ,1.15		        , "Аэрогриль"				            , "Кухонная техника"			    , product);
                    matchProduct("01.16.01, Йогуртница"				                                            , "Йогуртницы"			                ,1.15		        , "Йогуртница"				        , "Кухонная техника"			    , product);
                    matchProduct("01.16.02, Электрические грили и барбекю"				                            , "Электрогрили"			            ,1.15		        , "Аэрогриль"				            , "Кухонная техника"			    , product);
                    matchProduct("01.16.06, Электрошашлычницы"			                                            , "Шашлычницы"			                ,1.18		        , "Шашлычница"				        , "Кухонная техника"			    , product);
                    matchProduct("01.17.02, Вафельницы"				                                            , "Вафельницы"			                ,1.18		        , "Вафельница"				        , "Кухонная техника"			    , product);
                    matchProduct("01.17.03"				                                                        , "Мультипекари"			            ,1.18		        , "Мультипекарь"				        , "Кухонная техника"			    , product);
                    matchProduct("01.17.04, Орешницы"				                                                , "Орешницы"			                ,1.18		        , "Орешница"				            , "Кухонная техника"			    , product);

                    /*ВСТРАИВАЕМАЯ ТЕХНИКА*/
                    matchProduct("07.01.01, Встраиваемый духовой шкаф"			                                    , "Встраиваемые духовые шкафы"			,1.15	            , "Встраиваемый духовой шкаф"			, "Встраиваемая техника"		    , product);
                    matchProduct("07.03, 07.04, Встраиваемая варочная поверхность"	                                , "Встраиваемые варочные панели"		,1.15	            , "Встраиваемая варочная панель"		, "Встраиваемая техника"		    , product);
                    matchProduct("07.05.04_Вытяжки встраиваемые, Вытяжка встраиваемая"								, "Встраиваемые вытяжки"				,1.15	            , "Встраиваемая вытяжка"				, "Встраиваемая техника"		    , product);
                    matchProduct("07.07, Холодильники встраиваемые"								                , "Встраиваемые холодильники"			,1.15	            , "Встраиваемый холодильник"			, "Встраиваемая техника"		    , product);
                    matchProduct("07.08, свч печи встраиваемые"									                , "Встраиваемые СВЧ"					,1.15	            , "Встраиваемая СВЧ"					, "Встраиваемая техника"		    , product);
                    matchProduct("07.06, Посудомоечные машины встраиваемые"						                , "Встраиваемые посудомоечные машины"	,1.15	            , "Встраиваемая посудомоечная машина"	, "Встраиваемая техника"		    , product);

                    /*ТЕЛЕ-ВИДЕО-АУДИО*/
                    matchProduct("02.02, LED Телевизор"												            , "Телевизоры"				            ,1.13				, "Телевизор"							, "Теле-Видео-Аудио"			    , product);
                    matchProduct("15.02.17.01, 15.02.18.01, TV-тюнер"	                                            , "Ресиверы для тв"			            ,1.25				, "Цифровой ресивер"					, "Теле-Видео-Аудио"			    , product);
                    matchProduct("15.08.24.03, 15.02.08, 15.02.09, 15.02.10"		                                , "Кабели ТВ"				            ,1.90				, "ТВ кабель"							, "Теле-Видео-Аудио"			    , product);
                    matchProduct("15.02.01, Кронштейны для ТВ"						                                , "Кронштейны ТВ"			            ,2				    , "ТВ кронштейн"						, "Теле-Видео-Аудио"			    , product);
                    matchProduct("15.02.17.02, Антенна телевизионная"			                                    , "Антенны ТВ"				            ,1.5				, "ТВ антенна"						, "Теле-Видео-Аудио"			    , product);
                    matchProduct("10.10, Музыкальные центры"										                , "Музыкальные центры"		            ,1.15				, "Музыкальный центр"					, "Теле-Видео-Аудио"			    , product);
                    matchProduct("15.02.07, Телемебель"											                , "Телемебель"				            ,1.40				, "Телемебель"						, "Теле-Видео-Аудио"			    , product);
                    matchProduct("10.17.01, Синтезаторы и цифровые фортепьяно"					                    , "Музыкальные инструменты"	            ,1.15				, "Музыкальный инструмент"			, "Теле-Видео-Аудио"			    , product);

                }
                else warningProduct(product);
            }
            catch (NullPointerException exp) {
                log.info("NullPointer at: " + product.getOriginalName());
                exp.printStackTrace();
            }
        }
        log.info("Total matches: " + matchCounter);
    }

    private void matchProduct(String alias, String productGroup, double coefficient, String single, String productCategory, Product product)
    {
        String[] matches = alias.split(",");
        String supp = product.getSupplier();

        for (String match : matches)
        {
            try
            {
                if ((supp.equals("1RBT") && StringUtils.startsWithIgnoreCase(product.getOriginalType(), match.trim())))
                {
                    String brand = product.getOriginalBrand();

                    product.setProductGroup(productGroup);
                    product.setSingleType(single);
                    product.setProductCategory(productCategory);

                    String model        = StringUtils.substringAfter(product.getOriginalName().toUpperCase(), brand.toUpperCase()).trim();
                    String fullName     = product.getSingleType().concat(" ").concat(StringUtils.capitalize(brand.toLowerCase())).concat(" ").concat(model);
                    String type         = resolveProductType(product.getOriginalType());
                    String groupBrand   = single.concat(" ").concat(StringUtils.capitalize(brand.toLowerCase()));
                    String formAnno     = formatAnnotation(product.getOriginalAnnotation());

                    int finalPrice      = roundPrice(Integer.parseInt(StringUtils.deleteWhitespace(product.getOriginalPrice())));
                    int productBonus    = matchBonus(finalPrice);

                    product.setModelName(model);
                    product.setProductType(type);
                    product.setGroupBrand(groupBrand);
                    product.setFullName(fullName);
                    product.setFinalPrice(finalPrice);
                    product.setBonus(productBonus);
                    product.setFormattedAnnotation(formAnno);
                    productRepo.save(product);

                    System.out.println();
                    log.info("Product: "        + product.getOriginalName());
                    log.info("Model: "          + product.getModelName());
                    log.info("FullName: "       + product.getFullName());
                    log.info("ProductGroup: "   + product.getProductGroup());
                    log.info("Single: "         + product.getSingleType());
                    log.info("Price: "          + product.getFinalPrice());
                    log.info("Bonus: "          + product.getBonus());

                    matchCounter++;
                    return;
                }
                else if ((supp.equals("2RUS-BT") && (StringUtils.startsWithIgnoreCase(product.getRType(), match.trim()) || StringUtils.startsWithIgnoreCase(product.getRName(), match.trim()))))
                {
                    product.setProductGroup(productGroup);
                    product.setSingleType(single);
                    product.setProductCategory(productCategory);

                    String originalBrand = product.getOriginalBrand().toUpperCase();
                    String originalName  = product.getRName().toUpperCase();

                    if (originalName.contains(", ") && originalName.contains(originalBrand))
                    {

                        String annotation   = StringUtils.substringAfter(originalName,", ");
                        String model        = StringUtils.substringBetween(originalName, originalBrand, ",").trim();
                        String name         = StringUtils.capitalize(originalBrand.toLowerCase()).concat(" ").concat(model);//StringUtils.capitalize(originalBrand.concat(" ").concat(model).toLowerCase());
                        String fullName     = product.getSingleType().concat(" ").concat(StringUtils.capitalize(originalBrand.toLowerCase())).concat(" ").concat(model);
                        String groupBrand   = single.concat(" ").concat(StringUtils.capitalize(originalBrand.toLowerCase()));
                        int finalPrice      = roundPrice((int) Double.parseDouble(StringUtils.deleteWhitespace(product.getOriginalPrice()).replaceAll(",", ".")));
                        int productBonus    = matchBonus(finalPrice);

                        product.setOriginalName(name);
                        product.setOriginalAnnotation(annotation);
                        product.setModelName(model);
                        product.setFullName(fullName);
                        product.setGroupBrand(groupBrand);
                        product.setProductType(product.getOriginalType()); /// resolveTypeName();
                        product.setFinalPrice(finalPrice);
                        product.setBonus(productBonus);
                        productRepo.save(product);

                        System.out.println();
                        log.info("OrNAME: " + originalName);
                        log.info("NAME: " + product.getOriginalName());
                        log.info("FULL NAME: " + product.getFullName());
                        log.info("MODEL: " + product.getModelName());
                        log.info("ANNO: " + product.getOriginalAnnotation());
                        log.info("PRICE: " + product.getFinalPrice());
                        log.info("BONUS: "  + product.getBonus());

                        matchCounter++;
                        return;
                    }
                }
            }
            catch (NullPointerException e) {
                System.out.println();
                log.warning("NULL EXP " + product.getOriginalName());
                e.printStackTrace();
            }
            catch (NumberFormatException e) {
                System.out.println();
                log.warning("NUMBER EXP " + product.getOriginalPrice());
            }
        }
    }

    private int roundPrice(int finalPrice) {
        String val = String.valueOf(finalPrice);
        if (finalPrice > 0 && finalPrice <= 10) {
            return 10;
        }
        else if (finalPrice > 10 && finalPrice < 1000)
        {
            val = val.substring(0, val.length()-1).concat("9");
            return Integer.parseInt(val);
        }
        else if (finalPrice > 1000)
        {
            val = val.substring(0, val.length()-2).concat("90");
            return Integer.parseInt(val);
        }
        else return finalPrice;
    }
    private Integer matchBonus(int price)
    {
        int bonus = price * 3 / 100;
        String val = String.valueOf(bonus);
        if (bonus > 0 && bonus <= 10) {
            return 10;
        }
        else
        {
            val = val.substring(0, val.length()-1).concat("0");
            return Integer.parseInt(val);
        }
    }

    private boolean productValidToMatch(Product product) {
        return product.getProductGroup() == null && !product.getOriginalBrand().isEmpty() && (product.getOriginalName().toUpperCase()).contains(product.getOriginalBrand().toUpperCase());
    }

    private void warningProduct(Product product) {
        System.out.println();
        log.warning("INCORRECT PRODUCT: " + product.getOriginalName());
        log.warning("BRAND: " + product.getOriginalBrand());
        log.warning("EMPTY GROUP: " + (product.getProductGroup() == null));
    }

    public String formatAnnotation(String anno)
    {
        if (!anno.isEmpty() && anno.contains(";")) {
            return anno.replaceAll(";", "<br>");
        }
        return null;
    }

    public String resolveProductType(String originalType)
    {
        if (originalType.contains(" ") && originalType.contains("_")) {
            return StringUtils.substringAfter(originalType, "_");
        }
        else if (originalType.contains("_")) {
            return StringUtils.substringAfter(originalType, "_");
        }
        else if (originalType.contains(" ")) {
            return StringUtils.substringAfter(originalType, " ");
        }
        return originalType;
    }
}
    /*public void resolveDuplicates(String request)
    {
        List<Product> products = productRepo.findProductsByProductGroupEqualsIgnoreCase(request);
        products.sort(Comparator.comparing(Product::getModelName));

        for (Product product : products)
        {
            String modelName = product.getModelName();
            if (modelName != null)
            {
                findDuplicates(products, modelName);
            }
        }
    }*/



    /*public void findDuplicates(List<Product> products, String modelName)
    {
        List<Product> duplicates = products.stream()
                .filter(product -> StringUtils.containsIgnoreCase(product.getOriginalName(), modelName) || StringUtils.containsIgnoreCase(product.getModelName(), modelName))
                .collect(Collectors.toList());

        if (duplicates.size() > 1)
        {
            duplicates.sort(Comparator.comparing(Product::getModelName));

            System.out.println();
            log.info("MODEL: " + modelName);
            log.info("Size: " + duplicates.size());
            duplicates.forEach(product -> log.info(product.getModelName() + "; " + product.getSupplier() + "; " + product.getPrice()));
        }
    }*/

    /*public void showModelName(String request)
    {
        List<Product> products = productRepo.findProductsByProductGroupEqualsIgnoreCase(request);
        products.sort(Comparator.comparing(Product::getModelName));

        products.forEach(product ->
        {
            if (product.getModelName() != null)
            {
                System.out.println();
                log.info(product.getSupplier());
                log.info(product.getOriginalName());
            }
        });
    }*/



    /*private boolean checkBrandAndGroup(Product product) {
        return !product.getOriginalBrand().isEmpty() && product.getProductGroup() != null;
    }

    public void resolveProductModel()
    {
        List<Product> products1 = productRepo.findAll();//findBySupplier("1RBT");
        products1.forEach(product ->
        {
            if (product.getModelName() == null)
            {
                if (checkBrandAndGroup(product)) trimModelNameAfterBrand(product);
            }

        });

        *//*
        List<Product> products2 = productRepo.findBySupplier("2RUS-BT");
        for (Product product : products2)
        {
            if (checkBrandAndGroup(product))
            {
                try {
                    String originalName = product.getOriginalName();
                    String brand = product.getOriginalBrand();

                    product.setModelName(StringUtils.substringBetween(originalName, brand, ",").trim());
                    productRepo.save(product);

                    System.out.println();
                    log.info(originalName);
                    log.info(product.getModelName());
                }
                catch (NullPointerException e) {
                    log.info("NULL at " + product.getOriginalName());
                    e.printStackTrace();
                }
            }
        }
        List<Product> products3 = productRepo.findBySupplier("3M-TRADE");
        products3.forEach(product ->
        {
            if (checkBrandAndGroup(product))
            {
                trimModelNameAfterBrand(product);
            }
        });
        *//*
    }*/

    /*private void trimModelNameAfterBrand(Product product)
    {
        try
        {
            String modelName = StringUtils.substringAfter(product.getOriginalName().toUpperCase(), product.getOriginalBrand().toUpperCase()).trim();

            product.setModelName(modelName);
            productRepo.save(product);

            System.out.println();
            log.info(product.getOriginalName());
            log.info(product.getModelName());
        }
        catch (NullPointerException e) {
            log.info("NULL at " + product.getOriginalName());
            e.printStackTrace();
        }
    }*/


    /*public void resolveOriginalPrice() {
        List<Product> products= productRepo.findAll();
        for (Product product : products)
        {
            try
            {
                if (product.getOriginalPrice().contains(",")) {
                    product.setPrice(Integer.parseInt(StringUtils.substringBefore(product.getOriginalPrice().replaceAll(" ", ""), ",")));
                }
                else {
                    product.setPrice(Integer.parseInt(product.getOriginalPrice().replaceAll(" ", "")));
                }
                productRepo.save(product);
            }
            catch (Exception exp) {
                exp.printStackTrace();
            }
        }
    }*/

    /*public void resolveTypeBrand() {
        List<Product> products = productRepo.findAll();
        products.forEach(product ->
        {
            if (product.getSingleType() != null)
            {
                String typeBrand = product.getSingleType().concat(" ").concat(StringUtils.capitalize(product.getOriginalBrand().toLowerCase()));
                product.setGroupBrand(typeBrand);
                productRepo.save(product);
            }
        });
    }*/


