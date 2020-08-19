package com.bw.controller;


import com.bw.bean.Goods;
import com.bw.service.GoodsService;
import com.bw.utils.FileUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class GoodsController {

    @Resource
    GoodsService gs;

    @RequestMapping("list")
    public String sel(Model model, @RequestParam(defaultValue = "1")int pageNum,
                      @RequestParam(defaultValue = "") String gname){

        //开始分页
        int pageSize=2;
        PageHelper.startPage(pageNum,pageSize);

        Map<String,Object> map = new HashMap<>();
        map.put("gname",gname);
        List<Goods> s = gs.select(map);

        PageInfo<Goods> ss = new PageInfo<>(s);
        model.addAttribute("list",ss);
        return "list";
    }

    @RequestMapping("add")
    public String add(Goods goods, MultipartFile myfile) throws IOException {
        //图片上传 调用工具类
        String upload = FileUtils.upload(myfile);
        goods.setPhoto(upload);
        int x = gs.insert(goods);
        if (x>0){
            return "forward:list";
        }else {
            return "add";
        }
    }
    @RequestMapping("lookImg")
    public void lookImg(String path,HttpServletRequest request,HttpServletResponse response){
        FileUtils.lookImg(path, request, response);
    }

    @RequestMapping("del")
    public String del(int gid){
        int del = gs.del(gid);
        if (del>0){
            return "forward:list";
        }else {
            return "del";
        }
    }

    @RequestMapping("hx")
    public String hx(int gid,Model model){
        Goods hx = gs.hx(gid);
        model.addAttribute("list",hx);
        return "update";
    }

    @RequestMapping("update")
    public String update(Goods goods,MultipartFile myfile) throws IOException {
        //图片上传 调用工具类
        String upload = FileUtils.upload(myfile);
        goods.setPhoto(upload);
        int update = gs.update(goods);
        if (update>0){
            return "forward:list";
        }else {
            return "del";
        }
    }
}
