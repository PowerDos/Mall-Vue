package com.example.goods.entities;

import com.example.entitity.DO.BaseDo;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;

import java.io.Serializable;
import java.util.Date;


@Data
@Document(indexName = "example_goods",type = "_doc")
public class ESProductDO implements Serializable {

    private static final long serialVersionUID = 6320548148250372657L;

    /**
     * id
     */
    @Id
    private Long id;

    /**
     * 创建时间
     */
    @Field(type = FieldType.Date,index = false)
    private Date created_time;

    /**
     * 修改时间
     *
     */
    @Field(type = FieldType.Date,index = false)
    private Date updated_time;

    /**
     * 产品的类型id
     */
    @Field(type = FieldType.Long,index = false)
    private String category_id;

    /**
     * 产品名
     */
    @Field(type = FieldType.Text,analyzer = "ik_max_word")
    private String name;

    /**
     * 产品简介
     */
    @Field(type = FieldType.Text,analyzer = "ik_max_word")
    private String intro;

    /**
     * 图像地址
     */
    @Field(type = FieldType.Text,index = false)
    private String img;

    /**
     * 产品的所有规格型号id
     */
    @Field(type = FieldType.Text,index = false)
    private String attribute_id_list;

    /**
     * 产品最低价
     */
    @Field(type = FieldType.Float,index = false)
    private String lowest_price;

    /**
     * 店家名
     */
    @Field(type = FieldType.Text,index = false)
    private String shop_name;

    /**
     * 店家id
     */
    @Field(type = FieldType.Long,index = false)
    private Long shop_id;

    /**
     * 商品优惠活动
     */
    @Field(type = FieldType.Text,index = false)
    private String discount_id_list;

    /**
     * 商品促销活动
     */
    @Field(type = FieldType.Text,index = false)
    private String promotion_id_list;

    /**
     * 商品所有规格
     */
    @Field(type = FieldType.Text,index = false)
    private String specs_id_list;


    /**
     * 商品所有评论id
     */
    @Field(type = FieldType.Long,index = false)
    private String remarks_id;

    /**
     * 历史销量
     */

    @Field(type = FieldType.Long,index = false)
    private Long sale;

    /**
     * 评价数
     */
    @Field(type = FieldType.Long,index = false)
    private Long comment;

    /**
     * 评价数
     */
    @Field(type = FieldType.Text,index = false)
    private String product_detail_img;

    /**
     * 状态
     */
    @Field(type = FieldType.Long,index = false)
    private String status;

    /**
     * 乐观锁
     */
    @Field(type = FieldType.Long,index = false)
    private String revision;

    /**
     * createdBy
     */
    @Field(type = FieldType.Text,index = false)
    private String created_by;

    /**
     * updatedBy
     */
    @Field(type = FieldType.Text,index = false)
    private String updated_by;
}
