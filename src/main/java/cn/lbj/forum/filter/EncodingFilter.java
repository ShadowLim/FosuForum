package cn.lbj.forum.filter;

import javax.servlet.*;
import java.io.IOException;


public class EncodingFilter implements Filter {

    private String encode;

    public void destroy() {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (encode != null) {
            request.setCharacterEncoding(encode);
            response.setCharacterEncoding(encode);
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {
        encode = config.getInitParameter("encode");
    }

}
