package com.leqiang222.ssm.config;

import com.leqiang222.ssm.entity.SysLog;
import com.leqiang222.ssm.service.SysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @Description: LogAop$
 * @Author leqiang222
 * @Date: 2021/2/17$ 1:13 下午$
 */
@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private SysLogService sysLogService;

    private Date startTime; // 访问时间
    private Class executionClass;// 访问的类
    private Method executionMethod; // 访问的方法

    @Before("execution(* com.leqiang222.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint joinPoint) throws NoSuchMethodException, SecurityException {
        startTime = new Date(); // 访问时间
        // 获取访问的类
        executionClass = joinPoint.getTarget().getClass();
        // 获取访问的方法
        String methodName = joinPoint.getSignature().getName();// 获取访问的方法的名称

        Object[] args = joinPoint.getArgs();// 获取访问的方法的参数
        if (args == null || args.length == 0) {// 无参数
            executionMethod = executionClass.getMethod(methodName); // 只能获取无参数方法
        } else { // 有参数，就将args中所有元素遍历，获取对应的Class,装入到一个Class[]
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            executionMethod = executionClass.getMethod(methodName, classArgs);// 获取有参数方法
        }
    }

    //后置通知
    @After("execution(* com.leqiang222.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime() - startTime.getTime(); //获取访问的时长
        String url = "";

        if (executionClass == null || executionMethod == null || executionClass == LogAop.class) {
            return;
        }

        //1.获取类上的@RequestMapping("/orders")
        RequestMapping classAnnotation = (RequestMapping) executionClass.getAnnotation(RequestMapping.class);
        if (classAnnotation == null) {
            return;
        }

        //
        String[] classValue = classAnnotation.value();
        //2.获取方法上的@RequestMapping(xxx)
        RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
        if (methodAnnotation == null) {
            return;
        }

        String[] methodValue = methodAnnotation.value();
        url = classValue[0] + methodValue[0];

        //获取访问的ip
        String ip = request.getRemoteAddr();

        //获取当前操作的用户
        SecurityContext context = SecurityContextHolder.getContext();//从上下文中获了当前登录的用户
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();

        //将日志相关信息封装到SysLog对象
        SysLog sysLog = new SysLog();
        sysLog.setExecutionTime(time); //执行时长
        sysLog.setIp(ip);
        sysLog.setMethod(executionClass.getName() + "." + executionMethod.getName());
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(startTime);

        //调用Service完成操作
        int result = sysLogService.save(sysLog);

    }

}
