package xyz.ruankun.machinemother.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import xyz.ruankun.machinemother.annotation.Authentication;
import xyz.ruankun.machinemother.entity.AddtionalProduct;
import xyz.ruankun.machinemother.entity.DictProductType;
import xyz.ruankun.machinemother.entity.Product;
import xyz.ruankun.machinemother.entity.ProductProps;
import xyz.ruankun.machinemother.service.ProductService;
import xyz.ruankun.machinemother.util.Constant;
import xyz.ruankun.machinemother.util.constant.AuthAopConstant;
import xyz.ruankun.machinemother.vo.ResponseEntity;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping(value = "/product")
@Api(value = "服务产品相关的所有API")
@CrossOrigin
public class ProductController {

    @Autowired
    private ResponseEntity responseEntity;

    @Autowired
    private ProductService productService;

    @PutMapping(value = {"", "/"})
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]增加一个服务产品，同时要增加这个产品的各类参数信息")
    public ResponseEntity addProduct(@RequestBody AddtionalProduct addtionalProduct) {
        Product product = addtionalProduct.getProduct();
        List<ProductProps> productProps = addtionalProduct.getProductProps();
        if (product == null || productProps == null)
            return ControllerUtil.getDataResult(null);
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
    @ApiOperation(value = "[管理员]删除某产品")
    public ResponseEntity delete(@PathVariable(value = "id") Integer id) {
        return ControllerUtil.parData(productService.deleteProduct(id), null);
    }

    @PostMapping(value = "/{id}")
    @Authentication(role = AuthAopConstant.ADMIN)
    @ApiOperation(value = "[管理员]修改某产品")
    public ResponseEntity update(@PathVariable(value = "id") Integer id,@RequestBody Product product) {
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
    @ApiOperation(value = "[匿名]获取所有服务产品信息")
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
    @ApiOperation(value = "[匿名]根据类型的id获取某个类型的所有产品")
    public ResponseEntity getProducts(@PathVariable(value = "id") Integer id) {
        DictProductType dictProductType = productService.getProductType(id);
        if (dictProductType == null) {
            responseEntity.error(-1, "服务器故障", null);
        } else if (dictProductType.getId() == 0) {
            responseEntity.error(-1, "无效数据", null);
        } else {
            List<Product> products = productService.getProductsByTypeId(id);
            if (products.size() == 0) {
                responseEntity.error(-1, "无效数据", null);
            } else {
                responseEntity.success(1, "获取成功", products);
            }
        }
        return responseEntity;
    }

    @GetMapping(value = "/{id}/props")
    @ApiOperation(value = "[匿名]获取某产品的所有可选属性，列表")
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
    @ApiOperation(value = "[匿名]获取某个产品 的详细信息")
    public ResponseEntity getProduct(@PathVariable(value = "id") Integer id) {
        Product product = productService.getProduct(id);
        if (product == null) {
            responseEntity.error(-1, "服务器故障", null);
        } else if (product.getId() == 0) {
            responseEntity.error(-1, "无效数据", null);
        } else {
            responseEntity.success(1, "操作成功", product);
        }
        return responseEntity;
    }

    @GetMapping(value = "/type")
    @ApiOperation(value = "[匿名]获取产品类型列表")
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
