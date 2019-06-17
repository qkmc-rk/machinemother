package xyz.ruankun.machinemother.controller;

import org.apache.tomcat.util.bcel.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;
import xyz.ruankun.machinemother.service.ProductService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.List;

@RestController
@RequestMapping(value = "/product")
public class ProductController {

    @Autowired
    private ResponseEntity responseEntity;

    @Autowired
    private ProductService productService;

    @PutMapping(value = {"", "/"})
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity addProduct(Product product, @RequestParam(value = "productProps") List<ProductProps> productProps) {

        Boolean result = productService.addProduct(product, productProps);
        if (result) {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "添加成功", product);
        } else {
            responseEntity.error(Constant.PRODUCT_ERROR, "添加失败", null);
        }
        return responseEntity;
    }

    @DeleteMapping(value = "/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity delete(@PathVariable(value = "id") Integer id) {
        Boolean result = productService.deleteProduct(id);
        if (result) {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "删除成功", null);
        } else {
            responseEntity.error(Constant.PRODUCT_ERROR, "删除失败", null);
        }
        return responseEntity;
    }

    @PostMapping(value = "/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    public ResponseEntity update(@PathVariable(value = "id") Integer id, Product product) {
        if (id != product.getId()) {
            responseEntity.error(Constant.PRODUCT_ERROR, "错误数据", null);
        } else {
            Boolean result = productService.updateProduct(product);
            if (result) {
                responseEntity.success(Constant.PRODUCT_SUCCESS, "修改成功", null);
            } else {
                responseEntity.error(Constant.PRODUCT_ERROR, "修改失败", null);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = {"", "/"})
    @Authentication(pass = false)       //所有用户类型都可调用，但是对于出匿名外的用户还需进行token更新
    public ResponseEntity getAll() {
        List<Product> products = productService.getProducts();
        if (products.size() == 0) {
            responseEntity.error(Constant.PRODUCT_ERROR, "没有相关产品", null);
        } else {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "获取成功", products);
        }
        return responseEntity;
    }

    @GetMapping(value = "/type/{id}")
    @Authentication(pass = false)       //所有用户类型都可调用，但是对于出匿名外的用户还需进行token更新
    public ResponseEntity getProducts(@PathVariable(value = "id") Integer id) {
        DictProductType dictProductType = productService.getProductType(id);
        if (dictProductType == null) {
            responseEntity.error(Constant.PRODUCT_ERROR, "无效数据", null);
        } else {
            List<Product> products = productService.getProducts(id);
            if (products.size() == 0) {
                responseEntity.error(Constant.PRODUCT_ERROR, "无效数据", null);
            } else {
                responseEntity.success(Constant.PRODUCT_SUCCESS, "获取成功", products);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = "/{id}/props")
    @Authentication(pass = false)       //所有用户类型都可调用，但是对于出匿名外的用户还需进行token更新
    public ResponseEntity getProps(@PathVariable(value = "id") Integer id) {
        List<ProductProps> props = productService.getProps(id);
        if (props.size() == 0) {
            responseEntity.error(Constant.PRODUCT_ERROR, "无效数据", null);
        } else {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "获取成功", props);
        }
        return responseEntity;
    }

    @GetMapping(value = "/{id}")
    @Authentication(pass = false)       //所有用户类型都可调用，但是对于出匿名外的用户还需进行token更新
    public ResponseEntity getProduct(@PathVariable(value = "id") Integer id) {
        Product product = productService.getProduct(id);
        if (product == null) {
            responseEntity.error(Constant.PRODUCT_ERROR, "无效数据", null);
        } else {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "操作成功", product);
        }
        return responseEntity;
    }

    @GetMapping(value = "/type")
    @Authentication(pass = false)       //所有用户类型都可调用，但是对于出匿名外的用户还需进行token更新
    public ResponseEntity getType() {
        List<DictProductType> types = productService.getTypes();
        if (types.size() == 0) {
            responseEntity.error(Constant.PRODUCT_ERROR, "获取失败", null);
        } else {
            responseEntity.success(Constant.PRODUCT_SUCCESS, "获取成功", types);
        }
        return responseEntity;
    }
}
