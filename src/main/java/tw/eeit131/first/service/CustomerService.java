package tw.eeit131.first.service;

import java.util.Date;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.eeit131.first.exception.PwdNotMatchedException;
import tw.eeit131.first.exception.TwoPwdNotMatchedException;

import tw.eeit131.first.exception.UserAlreadySignedUpException;
import tw.eeit131.first.model.Customer;
import tw.eeit131.first.model.ShopBean;
import tw.eeit131.first.model.SignUpRequestDTO;
import tw.eeit131.first.repository.CustomerRepository;


@Service
public class CustomerService {

	@Autowired
	EntityManager entityManager;
	
	@Autowired
	CustomerRepository customerRepository;
	
	
	public Customer checkLogin(String email, String password) {
	
		String hql = "from Customer where Email=:email and password=:password";
		Query<Customer> query = (Query<Customer>) entityManager.createQuery(hql, Customer.class);
		
		//TODO Opt (Enc)		
				
		query.setParameter("email", email);
		query.setParameter("password", password);
		Customer result = query.uniqueResult();
		
		return result;

	}

	
	public Customer findByIdReturnCustomer(Long id) {
		return customerRepository.findByIdReturnCustomer(id);
	}
	

	public int updateCustomer(String name, String gender, Date birthday, String cellphone, String address, String email) {
		return customerRepository.updateCustomer(name, gender, birthday, cellphone, address, email);
	}


	public void deleteById(Long id) {
		customerRepository.deleteById(id);		
	}


	public void signUp(SignUpRequestDTO signUpRequest) throws UserAlreadySignedUpException {
		
    	if (customerRepository.findByEmail(signUpRequest.getEmail()).isPresent()) {	
         	
         	throw new UserAlreadySignedUpException();
         	
         }
    	
    	Customer customer = new Customer(signUpRequest.getName(), signUpRequest.getGender(), signUpRequest.getBirthday(), signUpRequest.getEmail(), signUpRequest.getCellphone(), signUpRequest.getAddress(), signUpRequest.getPassword());
		
		customerRepository.save(customer);
		
	}


	public void checkPassword(String oldPwdEnteredByUser, String passwordFromDB, String newPassword, String newPwdToBeConfirmed, Customer customerFromDB) throws PwdNotMatchedException, TwoPwdNotMatchedException {
		
		if (oldPwdEnteredByUser.equals(passwordFromDB) && newPassword.equals(newPwdToBeConfirmed)) {
	        
			customerFromDB.setPassword(newPassword);
			customerRepository.save(customerFromDB);
	        
		}
		
		else if (oldPwdEnteredByUser.equals(passwordFromDB) && !newPassword.equals(newPwdToBeConfirmed)) {
			
			throw new TwoPwdNotMatchedException();

		}
		
		else if (!oldPwdEnteredByUser.equals(passwordFromDB)) {
		
			throw new PwdNotMatchedException();

		}
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
