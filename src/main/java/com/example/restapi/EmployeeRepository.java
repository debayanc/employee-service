package com.example.restapi;

import org.springframework.data.jpa.repository.JpaRepository;
interface EmployeeRepository extends JpaRepository<Employee, Long> {
    // Custom query methods can be defined here if needed
}