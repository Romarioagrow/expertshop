package expertshop.repos;
import expertshop.domain.Product;
import expertshop.domain.lists.Category;
import expertshop.domain.lists.SubCategory;
import expertshop.domain.lists.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Long> {
    List<Product> findByCategory(Category category);

    List<Product> findByType(Type type);

    /*List<Product> findByParameters(Params parameters);
    List<Product> findAllByParameters(String[] parameters);
    List<Product> findByCategoryAndParameters(Category category, Params parameters);*/

    List<Product> findByCategoryAndBrand(Category category, String brand);

    List<Product> findByCategoryAndCountry(Category category, String country);

    List<Product> findByCategoryAndBrandOrCategoryAndCountry(Category category, String brand, Category category2, String country);

    List<Product> findByBrandOrCountry(String brand, String country);

    List<Product> findBySubCategory(SubCategory subCategory);

    List<Product> findByBrand(String brand);

    List<Product> findByCountry(String country);

}
