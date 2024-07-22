package com.bannershallmark.schedulers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;


import com.bannershallmark.entity.Store;
import com.bannershallmark.service.StoreService;
import com.bannershallmark.util.ReflectionUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component
@EnableScheduling
public class CronJobScheduler {

	private static Logger testNGlogger = Logger.getLogger(CronJobScheduler.class);
	private static final String DEFAULT_MERGED_INTO_ID = "00000000000000000000";
	private static final String EVERY_2_MIN = "0 */2 * * * *";
	private static final String EVERY_DAY = "0 0 0 * * *";
	private static final Boolean EXECUTE_CRON_JOB = Boolean.FALSE;
	
	
	@Value("${url}")
	private String url;
	@Value("${userName}")
	private String userName;
	@Value("${password}")
	private String password;
	@Value("${orgId}")
	private String orgId;
	@Value("${devKey}")
	private String devKey;

	@Scheduled(cron = EVERY_DAY)
	public void checkVendorSynchronization() {
		testNGlogger.info("Cron job Started at " + getCurrentTime() + ", dd/MM/yyyy HH:mm:ss for Vendor");
		if(EXECUTE_CRON_JOB) {
			ArrayList<String> propertiesToIgnoreInComparision = new ArrayList<String>();
			
			propertiesToIgnoreInComparision.add("id");
			propertiesToIgnoreInComparision.add("entity");
			propertiesToIgnoreInComparision.add("vendorUnqId");
			propertiesToIgnoreInComparision.add("vendorName");
			propertiesToIgnoreInComparision.add("accountType");
			propertiesToIgnoreInComparision.add("address1");
			propertiesToIgnoreInComparision.add("address2");
			propertiesToIgnoreInComparision.add("address3");
			propertiesToIgnoreInComparision.add("address4");
			propertiesToIgnoreInComparision.add("addressCity");
			propertiesToIgnoreInComparision.add("addressCountry");
			propertiesToIgnoreInComparision.add("addressLine4");
			propertiesToIgnoreInComparision.add("addressState");
			propertiesToIgnoreInComparision.add("addressZip");
			propertiesToIgnoreInComparision.add("repPhoneNumber");
			propertiesToIgnoreInComparision.add("isActive");
			propertiesToIgnoreInComparision.add("lastBalanceUpdate");
			propertiesToIgnoreInComparision.add("vcardEnrollDate");
			propertiesToIgnoreInComparision.add("vcardDeclineDate");
			propertiesToIgnoreInComparision.add("lastPaymentDate");
			propertiesToIgnoreInComparision.add("payBy");
			propertiesToIgnoreInComparision.add("billSyncPref");
			propertiesToIgnoreInComparision.add("taxIdType");
			propertiesToIgnoreInComparision.add("accountType");
			propertiesToIgnoreInComparision.add("prefPmtMethod");
			propertiesToIgnoreInComparision.add("orgVCardOptOutCustReason");
			propertiesToIgnoreInComparision.add("prefRemitEmail");
			propertiesToIgnoreInComparision.add("mergedIntoId");
			propertiesToIgnoreInComparision.add("primaryEmail");
			propertiesToIgnoreInComparision.add("shortName");
			
//			try {
//				List<Vendor> allVendors = vendorService.findAll();
//				System.out.println("allVendors.size() :" + allVendors.size());
//				RestTemplate template = new RestTemplate();
//				HttpHeaders headers = new HttpHeaders();
//				ResponseEntity<BillLoginResponse> response = billDotComUtil.doLogin();
//				
//				if (response.getBody().getResponse_data().getSessionId() != null) {
//					// Log In Success to bill.com
//					BillDotComReadHelper billDotComReadHelper = null;
//					for (Iterator<Vendor> iterator = allVendors.iterator(); iterator.hasNext();) {
//						Vendor vendor = iterator.next();
//						if(vendor.getVendorUnqId() != null) {
//							billDotComReadHelper = new BillDotComReadHelper();
//							billDotComReadHelper.setId(vendor.getVendorUnqId());
//							Integer vendorId = vendor.getId();
//							HttpHeaders header = new HttpHeaders();
//							headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
//							ObjectMapper mapper = new ObjectMapper();
//							
//							MultiValueMap<String, String> maps = new LinkedMultiValueMap<>();
//							maps.add("devKey", devKey);
//							maps.add("sessionId", response.getBody().getResponse_data().getSessionId());
//							maps.add("data", mapper.writeValueAsString(billDotComReadHelper));
//							
//							HttpEntity<MultiValueMap<String, String>> ent = new HttpEntity<>(maps, header);
//							ResponseEntity<ReadVendorResponse> responses = template.exchange(url + "Crud/Read/Vendor.json", HttpMethod.POST, ent, ReadVendorResponse.class);
//							
//							if (responses.getBody().getResponse_message().equals("Success")) {
//								BillVendor dataOnBillDotCom =  responses.getBody().getResponse_data();
//								
//								boolean isSynchronized = ReflectionUtil.haveSameValues(dataOnBillDotCom,vendor,propertiesToIgnoreInComparision,false);
//								isSynchronized = isSynchronized && 
//										Objects.equals(dataOnBillDotCom.getName(), vendor.getVendorName()) &&
//										Objects.equals(dataOnBillDotCom.getAddress1(), vendor.getAddressLine1()) &&
//										Objects.equals(dataOnBillDotCom.getAddress2(), vendor.getAddressLine2()) &&
//										Objects.equals(dataOnBillDotCom.getAddress3(), vendor.getAddressLine3()) &&
//										Objects.equals(dataOnBillDotCom.getAddress4(), vendor.getAddressLine4()) &&
//										Objects.equals(dataOnBillDotCom.getAddressCity(), vendor.getCity()) &&
//										Objects.equals(dataOnBillDotCom.getAddressZip(), vendor.getPostalCode()) &&
//										Objects.equals(dataOnBillDotCom.getAddressCountry(), vendor.getCountry()) &&
//										Objects.equals(dataOnBillDotCom.getAddressState(), vendor.getState()) &&
//										Objects.equals(dataOnBillDotCom.getLastBalanceUpdate(), StringOrNull(vendor.getLastBalanceUpdate())) &&
//										Objects.equals(dataOnBillDotCom.getVcardEnrollDate(), StringOrNull(vendor.getVcardEnrollDate())) &&
//										Objects.equals(dataOnBillDotCom.getVcardDeclineDate(), StringOrNull(vendor.getVcardDeclineDate())) &&
//										Objects.equals(dataOnBillDotCom.getLastPaymentDate(), StringOrNull(vendor.getLastPaymentDate())) &&
//										Objects.equals(dataOnBillDotCom.getPayBy(), StringOrNull(vendor.getPayBy())) &&
//										Objects.equals(dataOnBillDotCom.getTaxIdType(), StringOrNull(vendor.getTaxIdType())) &&
//										Objects.equals(dataOnBillDotCom.getAccountType(), StringOrNull(vendor.getAccountType())) &&
//										Objects.equals(dataOnBillDotCom.getPrefPmtMethod(), StringOrNull(vendor.getPrefPmtMethod())) &&
//										Objects.equals(dataOnBillDotCom.getPrefRemitEmail(), StringOrNull(vendor.getPrefRemitEmail())) &&
//										Objects.equals(dataOnBillDotCom.getOrgVCardOptOutCustReason(), StringOrNull(vendor.getOrgVCardOptOutCustReason())) &&
//										Objects.equals(dataOnBillDotCom.getPhone(), vendor.getPhoneNumber()) &&
//										Objects.equals(dataOnBillDotCom.getEmail(), vendor.getPrimaryEmail()) &&
//										Objects.equals(dataOnBillDotCom.getBillSyncPref(), StringOrNull(vendor.getBillSyncPref()));
//								Objects.equals(dataOnBillDotCom.getShortName(), StringOrNull(vendor.getVendorNo()));
//								
//								if(dataOnBillDotCom.getIsActive().equals("1")) {
//									isSynchronized = isSynchronized &&  vendor.getIsActive().equals(Boolean.TRUE);
//								} else {
//									isSynchronized = isSynchronized &&  vendor.getIsActive().equals(Boolean.FALSE);
//								}
//								if(vendor.isSynchronized() != isSynchronized) {
//									vendor.setSynchronized(isSynchronized);
//									vendorService.updateVendorSyncStatus(vendor);
//									// testNGlogger.info("Upated vendor with id:" + vendor.getId() + "vendor.isSynchronized:" + vendor.isSynchronized());
//								} else {
//									// testNGlogger.info("vendor with Id: " + vendor.getId() + " Not Updated as Alredy Synchronized:" + vendor.isSynchronized());
//								}
//							} else {
//								testNGlogger.info("ERROR to call API in Cron Job checkVendorSynchronization:" + responses.getBody().getResponse_data());
//							}
//						}
//					}
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				testNGlogger.info("ERROR in cron Job checkVendorSynchronization, MESSAGES : " + e.getMessage());
//			}
			testNGlogger.info("Cron Job checkChartOfAccountSynchronization Succeed for Vendor");
			
		} else {
			testNGlogger.info("Cron Job checkChartOfAccountSynchronization SKIPPED for Vendor");
		}
	}


	private static String getCurrentTime() {
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		return formatter.format(date);
	}

	private String StringOrNull(Object intStr) {
		if(null == intStr) {
			return null;
		}
		return String.valueOf(intStr);
	}

	private Boolean compareEqualDate(Date date1, Date date2) {
		if(date1 == date2) {
			return true;
		}
		return (date1 != null && date1.compareTo(date2) == 0);
	}
}