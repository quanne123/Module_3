package service.impl;

import model.Product;
import service.IProductService;

import java.util.ArrayList;
import java.util.List;

public class ProductServiceImpl implements IProductService {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1,"Ô tô",20000,"plane","KD"));
        productList.add(new Product(2,"Ô tô",20000,"plane","KD"));
        productList.add(new Product(3,"Ô tô",20000,"plane","KD"));
        productList.add(new Product(4,"Ô tô",20000,"plane","KD"));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);

    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void update(int id, Product product) {
        productList.add(id,product);
    }

    @Override
    public void remove(int id) {
        productList.remove(id);
    }


}
