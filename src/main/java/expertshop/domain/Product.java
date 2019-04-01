package expertshop.domain;
import expertshop.domain.categories.Category;
import expertshop.domain.categories.SubCategory;
import expertshop.domain.categories.Type;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "products")
public class Product implements Serializable {
    @Id
    private Long product_id;

    /*@OneToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "product_id")
    private Product product;*/

    @Column(name = "category")
    @Enumerated(EnumType.STRING)
    private Category category;

    @Column(name = "subcategory")
    @Enumerated(EnumType.STRING)
    private SubCategory subCategory;

    @Column(name = "type")
    @Enumerated(EnumType.STRING)
    private Type type;

    /*@Column(name = "type")
    @Enumerated(EnumType.STRING)
    private Type type;*/

    private String brand;
    private String model;
    private String country;
    private Integer price;

    @OneToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "product_parameters_id")
    private ProductParams productParams;

}


