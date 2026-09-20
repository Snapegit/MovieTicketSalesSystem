package com.cl.entity.view;

import com.cl.entity.DaiyingliebiaoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.cl.utils.EncryptUtil;
 

/**
 * 待映列表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@TableName("daiyingliebiao")
public class DaiyingliebiaoView  extends DaiyingliebiaoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DaiyingliebiaoView(){
	}
 
 	public DaiyingliebiaoView(DaiyingliebiaoEntity daiyingliebiaoEntity){
 	try {
			BeanUtils.copyProperties(this, daiyingliebiaoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
