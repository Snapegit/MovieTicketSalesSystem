package com.cl.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 电影评价
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@TableName("dianyingpingjia")
public class DianyingpingjiaEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public DianyingpingjiaEntity() {
		
	}
	
	public DianyingpingjiaEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 电影院名称
	 */
					
	private String dianyingyuanmingcheng;
	
	/**
	 * 电影名称
	 */
					
	private String dianyingmingcheng;
	
	/**
	 * 电影分类
	 */
					
	private String dianyingfenlei;
	
	/**
	 * 导演
	 */
					
	private String daoyan;
	
	/**
	 * 主演
	 */
					
	private String zhuyan;
	
	/**
	 * 片长
	 */
					
	private String pianzhang;
	
	/**
	 * 场次
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date changci;
	
	/**
	 * 评价
	 */
					
	private String pingjia;
	
	/**
	 * 评分
	 */
					
	private String pingfen;
	
	/**
	 * 评价时间
	 */
				
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 		
	private Date pingjiashijian;
	
	/**
	 * 用户账号
	 */
					
	private String yonghuzhanghao;
	
	/**
	 * 用户姓名
	 */
					
	private String yonghuxingming;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：电影院名称
	 */
	public void setDianyingyuanmingcheng(String dianyingyuanmingcheng) {
		this.dianyingyuanmingcheng = dianyingyuanmingcheng;
	}
	/**
	 * 获取：电影院名称
	 */
	public String getDianyingyuanmingcheng() {
		return dianyingyuanmingcheng;
	}
	/**
	 * 设置：电影名称
	 */
	public void setDianyingmingcheng(String dianyingmingcheng) {
		this.dianyingmingcheng = dianyingmingcheng;
	}
	/**
	 * 获取：电影名称
	 */
	public String getDianyingmingcheng() {
		return dianyingmingcheng;
	}
	/**
	 * 设置：电影分类
	 */
	public void setDianyingfenlei(String dianyingfenlei) {
		this.dianyingfenlei = dianyingfenlei;
	}
	/**
	 * 获取：电影分类
	 */
	public String getDianyingfenlei() {
		return dianyingfenlei;
	}
	/**
	 * 设置：导演
	 */
	public void setDaoyan(String daoyan) {
		this.daoyan = daoyan;
	}
	/**
	 * 获取：导演
	 */
	public String getDaoyan() {
		return daoyan;
	}
	/**
	 * 设置：主演
	 */
	public void setZhuyan(String zhuyan) {
		this.zhuyan = zhuyan;
	}
	/**
	 * 获取：主演
	 */
	public String getZhuyan() {
		return zhuyan;
	}
	/**
	 * 设置：片长
	 */
	public void setPianzhang(String pianzhang) {
		this.pianzhang = pianzhang;
	}
	/**
	 * 获取：片长
	 */
	public String getPianzhang() {
		return pianzhang;
	}
	/**
	 * 设置：场次
	 */
	public void setChangci(Date changci) {
		this.changci = changci;
	}
	/**
	 * 获取：场次
	 */
	public Date getChangci() {
		return changci;
	}
	/**
	 * 设置：评价
	 */
	public void setPingjia(String pingjia) {
		this.pingjia = pingjia;
	}
	/**
	 * 获取：评价
	 */
	public String getPingjia() {
		return pingjia;
	}
	/**
	 * 设置：评分
	 */
	public void setPingfen(String pingfen) {
		this.pingfen = pingfen;
	}
	/**
	 * 获取：评分
	 */
	public String getPingfen() {
		return pingfen;
	}
	/**
	 * 设置：评价时间
	 */
	public void setPingjiashijian(Date pingjiashijian) {
		this.pingjiashijian = pingjiashijian;
	}
	/**
	 * 获取：评价时间
	 */
	public Date getPingjiashijian() {
		return pingjiashijian;
	}
	/**
	 * 设置：用户账号
	 */
	public void setYonghuzhanghao(String yonghuzhanghao) {
		this.yonghuzhanghao = yonghuzhanghao;
	}
	/**
	 * 获取：用户账号
	 */
	public String getYonghuzhanghao() {
		return yonghuzhanghao;
	}
	/**
	 * 设置：用户姓名
	 */
	public void setYonghuxingming(String yonghuxingming) {
		this.yonghuxingming = yonghuxingming;
	}
	/**
	 * 获取：用户姓名
	 */
	public String getYonghuxingming() {
		return yonghuxingming;
	}

}
