package com.bannershallmark.config;

import static com.bannershallmark.util.Constants.Development.ON_SERVER;

import java.io.IOException;
import java.nio.channels.FileChannel;
import java.nio.channels.FileLock;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.mapdb.DB;
import org.mapdb.DBException;
import org.mapdb.DBMaker;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.WebApplicationInitializer;

import com.bannershallmark.util.Constants.Development;

/**
 * @author Niravdas
 */
@Configuration
public class WebEnvironmentInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        try {
            System.out.println("servletContext.getContextPath() :: " + servletContext.getContextPath());
            if (ON_SERVER) {
                String url = servletContext.getContextPath();
                if (Development.LIVE_URL.equalsIgnoreCase(url)) {
                    servletContext.setInitParameter("envName", ".live");
                } else {
                    servletContext.setInitParameter("envName", ".dev");
                }
            } else {
                servletContext.setInitParameter("envName", "");
            }
            
            
        } 
        catch (Exception e) {
            // Handle other exceptions
            System.out.println("An error occurred while opening the database file.");
            e.printStackTrace();
        }
    }
}
