package com.cl.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.cl.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.cl.annotation.IgnoreAuth;

import com.cl.entity.DianyingpingjiaEntity;
import com.cl.entity.view.DianyingpingjiaView;

import com.cl.service.DianyingpingjiaService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 电影评价
 * 后端接口
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@RestController
@RequestMapping("/dianyingpingjia")
public class DianyingpingjiaController {
    @Autowired
    private DianyingpingjiaService dianyingpingjiaService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DianyingpingjiaEntity dianyingpingjia,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date changcistart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date changciend,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			dianyingpingjia.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<DianyingpingjiaEntity> ew = new EntityWrapper<DianyingpingjiaEntity>();
                if(changcistart!=null) ew.ge("changci", changcistart);
                if(changciend!=null) ew.le("changci", changciend);

		PageUtils page = dianyingpingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dianyingpingjia), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DianyingpingjiaEntity dianyingpingjia, 
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date changcistart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") Date changciend,
		HttpServletRequest request){
        EntityWrapper<DianyingpingjiaEntity> ew = new EntityWrapper<DianyingpingjiaEntity>();
                if(changcistart!=null) ew.ge("changci", changcistart);
                if(changciend!=null) ew.le("changci", changciend);

		PageUtils page = dianyingpingjiaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dianyingpingjia), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DianyingpingjiaEntity dianyingpingjia){
       	EntityWrapper<DianyingpingjiaEntity> ew = new EntityWrapper<DianyingpingjiaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( dianyingpingjia, "dianyingpingjia")); 
        return R.ok().put("data", dianyingpingjiaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DianyingpingjiaEntity dianyingpingjia){
        EntityWrapper< DianyingpingjiaEntity> ew = new EntityWrapper< DianyingpingjiaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( dianyingpingjia, "dianyingpingjia")); 
		DianyingpingjiaView dianyingpingjiaView =  dianyingpingjiaService.selectView(ew);
		return R.ok("查询电影评价成功").put("data", dianyingpingjiaView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DianyingpingjiaEntity dianyingpingjia = dianyingpingjiaService.selectById(id);
		dianyingpingjia = dianyingpingjiaService.selectView(new EntityWrapper<DianyingpingjiaEntity>().eq("id", id));
        return R.ok().put("data", dianyingpingjia);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DianyingpingjiaEntity dianyingpingjia = dianyingpingjiaService.selectById(id);
		dianyingpingjia = dianyingpingjiaService.selectView(new EntityWrapper<DianyingpingjiaEntity>().eq("id", id));
        return R.ok().put("data", dianyingpingjia);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DianyingpingjiaEntity dianyingpingjia, HttpServletRequest request){
    	dianyingpingjia.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(dianyingpingjia);
        dianyingpingjiaService.insert(dianyingpingjia);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DianyingpingjiaEntity dianyingpingjia, HttpServletRequest request){
    	dianyingpingjia.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(dianyingpingjia);
        dianyingpingjiaService.insert(dianyingpingjia);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DianyingpingjiaEntity dianyingpingjia, HttpServletRequest request){
        //ValidatorUtils.validateEntity(dianyingpingjia);
        dianyingpingjiaService.updateById(dianyingpingjia);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        dianyingpingjiaService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
