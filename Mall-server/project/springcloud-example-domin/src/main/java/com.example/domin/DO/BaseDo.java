package com.example.domin.DO;

import java.util.Date;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class BaseDo {
	/**
	 * 创建时间
	 */
	@ApiModelProperty(value = "创建时间")
	private Date createdTime;
	/**
	 * 修改时间
	 *
	 */
	@ApiModelProperty(value = "修改时间")
	private Date updatedTime;
	/**
	 * id
	 */
	@ApiModelProperty(value = "id")
	private Long id;

}
