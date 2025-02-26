package com.example.controller;

import com.example.model.Employee;
import com.example.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

//    @GetMapping
//    public String listEmployees(Model model) {
//        List<Employee> employees = employeeService.getAllEmployees();
//        model.addAttribute("employees", employees);
//        return "employee-list";
//    }
    
    @GetMapping
    public String getAllEmployees(Model model,
                                   @RequestParam(defaultValue = "0") int page, // 默认页码为0
                                   @RequestParam(defaultValue = "10") int size) { // 默认每页显示20个员工
        Page<Employee> employeePage = employeeService.getAllEmployees(page, size);
        model.addAttribute("employeePage", employeePage); // 将分页结果传递给视图
        return "employee-list"; // 返回员工列表视图
    }
    

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("employee", new Employee());
        return "employee-form";
    }

    @PostMapping
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        employeeService.saveEmployee(employee);
        return "redirect:/employees";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Employee employee = employeeService.getEmployeeById(id);
        model.addAttribute("employee", employee);
        return "employee-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/employees";
    }
}
