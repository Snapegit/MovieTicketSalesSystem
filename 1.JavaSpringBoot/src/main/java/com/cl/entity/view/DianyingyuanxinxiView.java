package com.cl.entity.view;

import com.cl.entity.DianyingyuanxinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.cl.utils.EncryptUtil;
 

/**
 * 电影院信息
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@TableName("dianyingyuanxinxi")
public class DianyingyuanxinxiView  extends DianyingyuanxinxiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DianyingyuanxinxiView(){
	}
 
 	public DianyingyuanxinxiView(DianyingyuanxinxiEntity dianyingyuanxinxiEntity){
 	try {
			BeanUtils.copyProperties(this, dianyingyuanxinxiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
