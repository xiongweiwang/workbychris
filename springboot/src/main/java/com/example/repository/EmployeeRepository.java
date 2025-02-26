package com.example.repository;

import com.example.model.Employee;
import org.springframework.data.domain.Page;  // 正确的导入
import org.springframework.data.domain.Pageable;  // 正确的导入
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // JpaRepository 已经自动包含了 findById(), save(), findAll(), deleteById() 方法
    
    // 分页查询员工
    Page<Employee> findAll(Pageable pageable);
}
