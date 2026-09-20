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

import com.cl.entity.DaiyingliebiaoEntity;
import com.cl.entity.view.DaiyingliebiaoView;

import com.cl.service.DaiyingliebiaoService;
import com.cl.service.TokenService;
import com.cl.utils.PageUtils;
import com.cl.utils.R;
import com.cl.utils.MPUtil;
import com.cl.utils.CommonUtil;
import java.io.IOException;

/**
 * 待映列表
 * 后端接口
 * @author 
 * @email 
 * @date 2024-01-22 22:03:10
 */
@RestController
@RequestMapping("/daiyingliebiao")
public class DaiyingliebiaoController {
    @Autowired
    private DaiyingliebiaoService daiyingliebiaoService;



    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DaiyingliebiaoEntity daiyingliebiao,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date riqistart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date riqiend,
		HttpServletRequest request){
        EntityWrapper<DaiyingliebiaoEntity> ew = new EntityWrapper<DaiyingliebiaoEntity>();
                if(riqistart!=null) ew.ge("riqi", riqistart);
                if(riqiend!=null) ew.le("riqi", riqiend);

		PageUtils page = daiyingliebiaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, daiyingliebiao), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,DaiyingliebiaoEntity daiyingliebiao, 
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date riqistart,
                @RequestParam(required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date riqiend,
		HttpServletRequest request){
        EntityWrapper<DaiyingliebiaoEntity> ew = new EntityWrapper<DaiyingliebiaoEntity>();
                if(riqistart!=null) ew.ge("riqi", riqistart);
                if(riqiend!=null) ew.le("riqi", riqiend);

		PageUtils page = daiyingliebiaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, daiyingliebiao), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DaiyingliebiaoEntity daiyingliebiao){
       	EntityWrapper<DaiyingliebiaoEntity> ew = new EntityWrapper<DaiyingliebiaoEntity>();
      	ew.allEq(MPUtil.allEQMapPre( daiyingliebiao, "daiyingliebiao")); 
        return R.ok().put("data", daiyingliebiaoService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DaiyingliebiaoEntity daiyingliebiao){
        EntityWrapper< DaiyingliebiaoEntity> ew = new EntityWrapper< DaiyingliebiaoEntity>();
 		ew.allEq(MPUtil.allEQMapPre( daiyingliebiao, "daiyingliebiao")); 
		DaiyingliebiaoView daiyingliebiaoView =  daiyingliebiaoService.selectView(ew);
		return R.ok("查询待映列表成功").put("data", daiyingliebiaoView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DaiyingliebiaoEntity daiyingliebiao = daiyingliebiaoService.selectById(id);
		daiyingliebiao = daiyingliebiaoService.selectView(new EntityWrapper<DaiyingliebiaoEntity>().eq("id", id));
        return R.ok().put("data", daiyingliebiao);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DaiyingliebiaoEntity daiyingliebiao = daiyingliebiaoService.selectById(id);
		daiyingliebiao = daiyingliebiaoService.selectView(new EntityWrapper<DaiyingliebiaoEntity>().eq("id", id));
        return R.ok().put("data", daiyingliebiao);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DaiyingliebiaoEntity daiyingliebiao, HttpServletRequest request){
    	daiyingliebiao.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(daiyingliebiao);
        daiyingliebiaoService.insert(daiyingliebiao);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DaiyingliebiaoEntity daiyingliebiao, HttpServletRequest request){
    	daiyingliebiao.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(daiyingliebiao);
        daiyingliebiaoService.insert(daiyingliebiao);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody DaiyingliebiaoEntity daiyingliebiao, HttpServletRequest request){
        //ValidatorUtils.validateEntity(daiyingliebiao);
        daiyingliebiaoService.updateById(daiyingliebiao);//全部更新
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        daiyingliebiaoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	








}
