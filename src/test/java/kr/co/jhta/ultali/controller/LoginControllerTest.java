package kr.co.jhta.ultali.controller;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ExtendWith(SpringExtension.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/spring-ctx.xml"})
class LoginControllerTest {

	private MockMvc mvc;
	
	@Autowired
	private WebApplicationContext context;
	
	@BeforeEach
	void setUp() throws Exception {
		
		mvc = MockMvcBuilders.webAppContextSetup(context).build();
		
	}

	@Test
	void test() throws Exception {
		ResultActions actions = mvc.perform(get("/login/find"));
		MvcResult result = actions.andReturn();
		
		assertEquals("/login/find_id", mvc.perform(get("/login/find"))
								 .andExpect(status().isOk())
								 .andReturn()
								 .getModelAndView()
								 .getViewName());
		
	}

}
