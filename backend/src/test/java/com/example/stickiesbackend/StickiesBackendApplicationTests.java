package com.example.stickiesbackend;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class StickiesBackendApplicationTests {

    @Autowired
    private MockMvc mvc;

    @Autowired
    private StickyRepository repository;

    @After
    public void tearDown() {
        repository.deleteAll();
    }

    @Test
    public void contextLoads() {
    }

    @Test
    public void responseContainsEmptyArray_whenThereAreNoStickies() throws Exception {
        mvc.perform(get("/sticky"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$").isEmpty());

    }

    @Test
    public void responseOK_whenAddingSticky() throws Exception {
        mvc.perform(
                post("/sticky")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{ \"content\" : \"hello1\" }"))
                .andExpect(status().isOk());
    }

    @Test
    public void responseContainsArrayWithOneSticky_whenAddingOneSticky() throws Exception {


        mvc.perform(
                post("/sticky")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content("{ \"content\" : \"hello2\" }"));

        mvc.perform(get("/sticky"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].content").value("hello2"));
    }
}

