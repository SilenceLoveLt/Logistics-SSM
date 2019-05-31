package com.yyk.config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.yyk.entity.SysInvoice;
import com.yyk.entity.SysInvoiceCriteria;
import com.yyk.service.InvoiceService;

/**
* @author 作者 E-mail:
* @version 创建时间：2019年5月23日 下午1:41:11
* 类说明
*/
@Component
public class SchedulerTask {
	@Autowired
	@Qualifier("invoiceService")
	private  InvoiceService invoiceService;

	 @Scheduled(cron = "0 0 0 * * ? ")  //每天凌晨执行一次
    private void process() throws ParseException{
        /**
         * invoiceStatus 1——已发货   开始时间<startTime
         * invoiceStatus 2——运输中  endTime >开始时间>startTime
         * invoiceStatus 3——派送中  endTime <开始时间
         */
    	
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
    	Date now= df.parse(df.format(new Date()));
    	SysInvoiceCriteria criteria = new SysInvoiceCriteria();
	    SysInvoiceCriteria.Criteria cri = criteria.createCriteria();
	    cri.andStatusEqualTo(1);
	    List<SysInvoice> list=invoiceService.selectInfoInvoice(criteria);
    	for(SysInvoice invoice:list){
    		
    		SysInvoice sysInvoice=new SysInvoice();
    		criteria = new SysInvoiceCriteria();
    		cri = criteria.createCriteria();
    		cri.andInvoiceIdEqualTo(invoice.getInvoiceId());
    		Date date=now;
    		Date begin=invoice.getStartTime();
    		Date end=invoice.getEndTime();
    		
    		if( date.before(begin)){
    			sysInvoice.setInvoiceStatus(1);
    			invoiceService.updateInvoice(criteria, sysInvoice);
    			continue;
    		}
    	    if( date.after(begin) && date.before(end)){
    			sysInvoice.setInvoiceStatus(2);
    			invoiceService.updateInvoice(criteria, sysInvoice);
    			continue;
    		}
    	    if(  invoice.getInvoiceStatus()==4){
    			sysInvoice.setInvoiceStatus(4);
    			invoiceService.updateInvoice(criteria, sysInvoice);
    			continue;
    		}
    		if( date.after(end) ){
    			sysInvoice.setInvoiceStatus(3);
    			invoiceService.updateInvoice(criteria, sysInvoice);
    			continue;
    		}
    		
    		
    	}
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    }

}