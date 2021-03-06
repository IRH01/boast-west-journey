package com.hhly.smartdata.controller.authentication.api;

import com.google.common.collect.Maps;
import com.hhly.smartdata.controller.BaseController;
import com.hhly.smartdata.model.authentication.Admin;
import com.hhly.smartdata.model.authentication.Role;
import com.hhly.smartdata.model.authentication.User;
import com.hhly.smartdata.service.authentication.AdminService;
import com.hhly.smartdata.service.authentication.RoleService;
import com.hhly.smartdata.service.authentication.UserService;
import com.hhly.smartdata.util.Result;
import com.hhly.smartdata.util.page.Page;
import com.hhly.smartdata.util.page.PageUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin/admin")
public class AdminControllerApi extends BaseController{
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private AdminService adminService;

    @RequestMapping("/list")
    @RequiresPermissions("admin_admin_list")
    public ModelAndView list(@ModelAttribute Admin condition, @ModelAttribute Page page){
        PageUtil.startPage(page);
        Map<String, Object> model = Maps.newHashMap();
        model.put("condition", condition);
        try{
            model.put("adminList", adminService.searchAdmins(condition, page));
        }catch(Exception e){
            LOGGER.error(e.getMessage());
        }
        model.put("typeMap", Admin.Type.map());
        model.put("statusMap", User.statusMap);
        return new ModelAndView("system/admin/list", model);
    }

    /**
     * 启用用户
     */
    @RequestMapping("/on")
    @RequiresPermissions("admin_admin_on")
    public String on(@ModelAttribute User user){
        user.setUserStatus(User.ON);
        try{
            userService.update(user);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    /**
     * 禁用用户
     */
    @RequestMapping("/off")
    @RequiresPermissions("admin_admin_off")
    public String off(@ModelAttribute User user){
        user.setUserStatus(User.OFF);
        try{
            userService.update(user);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    /**
     * 初始化密码
     */
    @RequestMapping("/initPwd")
    @RequiresPermissions("admin_admin_initPwd")
    @ResponseBody
    public Result initPwd(@ModelAttribute User user){
        user.setPassword(new Md5Hash("123456").toString());
        try{
            userService.update(user);
        }catch(Exception e){
            e.printStackTrace();
        }
        return Result.success(null);
    }

    /**
     * 分配角色
     */
    @RequestMapping("/showRoles")
    @RequiresPermissions("admin_admin_allocRole")
    public ModelAndView showRoles(@RequestParam Integer userId){
        List<Role> hasRoles = null;
        try{
            hasRoles = roleService.getRolesByUserId(userId);
        }catch(Exception e){
            e.printStackTrace();
        }
        List<Role> allRoles = null;//null 即为查询全部
        try{
            allRoles = roleService.search(null, new Page(0, 0));
        }catch(Exception e){
            e.printStackTrace();
        }
        for(Role role : allRoles){
            if(hasRoles.contains(role)){
                role.setOwned(true);
            }else{
                role.setOwned(false);
            }
        }
        Map<String, Object> model = Maps.newHashMap();
        model.put("roleList", allRoles);
        model.put("userId", userId);
        return new ModelAndView("system/admin/alloc_role", model);
    }

    /**
     * 分配角色
     */
    @RequestMapping("/allocRole")
    @RequiresPermissions("admin_admin_allocRole")
    public String allocRole(@RequestParam Integer userId, @RequestParam Integer[] role){
        try{
            roleService.allocRole(userId, role);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    /**
     * 新增用户
     */
    @RequestMapping("/add")
    @RequiresPermissions("admin_admin_add")
    public ModelAndView add(){
        Map<String, Object> model = Maps.newHashMap();
        model.put("typeMap", Admin.Type.map());
        return new ModelAndView("system/admin/add", model);
    }

    /**
     * 保存用户
     */
    @RequestMapping("/save")
    @RequiresPermissions("admin_admin_add")
    public String save(@ModelAttribute Admin admin){
        admin.setPassword(new Md5Hash(admin.getPassword()).toString());
        admin.setUserStatus(User.ON);
        admin.setUserType(User.USER_ADMIN);
        try{
            adminService.save(admin);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    /**
     * 编辑
     */
    @RequestMapping("/edit")
    @RequiresPermissions("admin_admin_edit")
    public ModelAndView edit(@RequestParam Integer id){
        Map<String, Object> model = Maps.newHashMap();
        model.put("typeMap", Admin.Type.map());
        try{
            model.put("admin", adminService.get(id));
        }catch(Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("system/admin/edit", model);
    }

    /**
     * 保存用户
     */
    @RequestMapping("/modify")
    @RequiresPermissions("admin_admin_edit")
    public String modify(@ModelAttribute Admin admin){
        try{
            adminService.update(admin);
        }catch(Exception e){
            e.printStackTrace();
        }
        return "redirect:list.do";
    }

    /**
     * 删除用户
     */
    @RequestMapping("/del")
    @ResponseBody
    public Result deleteUser(@RequestParam Integer userId){
        try{
            if(0 < adminService.deleteByUserId(userId)){
                return Result.success(null);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return Result.fail();
    }
}
