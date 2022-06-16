package kh.spring.wcw.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;


@Component
@Aspect
public class AdviceLog {
	
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * kh.spring.wcw..*Dao.*(..))")
	public void daoPointcut() {}
	
	@Pointcut("execution(public * kh.spring.wcw..*Controller.*(..))")
	public void controllerPointcut() {}
	
	@Around("daoPointcut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;
		System.out.println("\t\t["+pjp.getThis()+"."+pjp.getSignature().getName()+"]");
		
		Object[] args = pjp.getArgs();
		for(int i = 0; i < args.length; i++) {
			System.out.print("\t\t--args["+i+"] : " + args[i] + "\n");
		}
		
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		ro = pjp.proceed();
		stopwatch.stop();
		System.out.println("\t\t[DAO Ret "+stopwatch.getTotalTimeMillis()+"(ms)경과 ] : " + ro);
		return ro;
	}
	
	@Around("controllerPointcut()")
	public Object aroundCtrlLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;
		System.out.println("\t[CTRL "+pjp.getThis()+"."+pjp.getSignature().getName()+"]");
		
		Object[] args = pjp.getArgs();
		for(int i = 0; i < args.length; i++) {
			System.out.print("\t-args["+i+"] : " + args[i] + "\n");
		}
		
		StopWatch stopwatch = new StopWatch();
		stopwatch.start();
		ro = pjp.proceed();
		stopwatch.stop();
		System.out.println("\t[CTRL Ret "+stopwatch.getTotalTimeMillis()+"(ms)경과 ] : " + ro);
		return ro;
	}
}
