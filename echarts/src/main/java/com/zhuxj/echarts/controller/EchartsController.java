package com.zhuxj.echarts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

@Controller
@RequestMapping("test")
public class EchartsController {
	@RequestMapping("dynamic")
	public ModelAndView getView(){
		ModelAndView view = new ModelAndView("dynamic");
		view.addObject("userNubs", 100);
		return view;
	}
	
	@RequestMapping("getdynamic")
	@ResponseBody
	public String returnView(){
		JsonObject obj = new JsonObject();
		int nub = (int) (Math.random()*1000);
		obj.addProperty("userCount", nub);
		return obj.toString();
	}
	
	@RequestMapping("gauge")
	public ModelAndView getGaugeView(){
		ModelAndView view = new ModelAndView("gauge");
		return view;
	}
	@RequestMapping("map")
	public ModelAndView getMapView(){
		ModelAndView view = new ModelAndView("map");
		return view;
	}
}
