package tw.eeit131.first.repository;

import java.util.Date;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit131.first.model.Customer;


@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {


    @Transactional
	@Modifying
    @Query("UPDATE Customer a SET a.name = ?1, a.gender = ?2, a.birthday = ?3, a.cellphone = ?4, a.address = ?5 WHERE a.email = ?6")
    int updateCustomer(String name, String gender, Date birthday, String cellphone, String address, String email);

    
    @Query(value = "SELECT c FROM Customer c WHERE c.id = ?1")
    Customer findByIdReturnCustomer(Long id);


    Optional<Customer> findByEmail(String email);
    
    
    
    
    
    
    
    
    
    
    
}
