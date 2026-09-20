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

import com.cl.entity.DianyingyuanxinxiEntity;
import com.cl.entity.view.DianyingyuanxinxiView;

import com.cl.service.DianyingyuanxinxiService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 电影院信息
 * 后端接口
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@RestController
@RequestMapping("/dianyingyuanxinxi")
public class DianyingyuanxinxiController {
    @Autowired
    private DianyingyuanxinxiService dianyingyuanxinxiService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DianyingyuanxinxiEntity dianyingyuanxinxi,
		HttpServletRequest request){
        EntityWrapper<DianyingyuanxinxiEntity> ew = new EntityWrapper<DianyingyuanxinxiEntity>();

		PageUtils page = dianyingyuanxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dianyingyuanxinxi), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DianyingyuanxinxiEntity dianyingyuanxinxi, 
		HttpServletRequest request){
        EntityWrapper<DianyingyuanxinxiEntity> ew = new EntityWrapper<DianyingyuanxinxiEntity>();

		PageUtils page = dianyingyuanxinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, dianyingyuanxinxi), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DianyingyuanxinxiEntity dianyingyuanxinxi){
       	EntityWrapper<DianyingyuanxinxiEntity> ew = new EntityWrapper<DianyingyuanxinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( dianyingyuanxinxi, "dianyingyuanxinxi")); 
        return R.ok().put("data", dianyingyuanxinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DianyingyuanxinxiEntity dianyingyuanxinxi){
        EntityWrapper< DianyingyuanxinxiEntity> ew = new EntityWrapper< DianyingyuanxinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( dianyingyuanxinxi, "dianyingyuanxinxi")); 
		DianyingyuanxinxiView dianyingyuanxinxiView =  dianyingyuanxinxiService.selectView(ew);
		return R.ok("查询电影院信息成功").put("data", dianyingyuanxinxiView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DianyingyuanxinxiEntity dianyingyuanxinxi = dianyingyuanxinxiService.selectById(id);
		dianyingyuanxinxi = dianyingyuanxinxiService.selectView(new EntityWrapper<DianyingyuanxinxiEntity>().eq("id", id));
        return R.ok().put("data", dianyingyuanxinxi);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DianyingyuanxinxiEntity dianyingyuanxinxi = dianyingyuanxinxiService.selectById(id);
		dianyingyuanxinxi = dianyingyuanxinxiService.selectView(new EntityWrapper<DianyingyuanxinxiEntity>().eq("id", id));
        return R.ok().put("data", dianyingyuanxinxi);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DianyingyuanxinxiEntity dianyingyuanxinxi, HttpServletRequest request){
    	dianyingyuanxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(dianyingyuanxinxi);
        dianyingyuanxinxiService.insert(dianyingyuanxinxi);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DianyingyuanxinxiEntity dianyingyuanxinxi, HttpServletRequest request){
    	dianyingyuanxinxi.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(dianyingyuanxinxi);
        dianyingyuanxinxiService.insert(dianyingyuanxinxi);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DianyingyuanxinxiEntity dianyingyuanxinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(dianyingyuanxinxi);
        dianyingyuanxinxiService.updateById(dianyingyuanxinxi);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        dianyingyuanxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
