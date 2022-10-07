package com.goodee.home.store.product;

public class ProductOptionDTO {

   private Long optionNum;
   private String optionName;
   private Long optionPrice;
   private Integer optionDiv;
   private Long productNum;
   private Long optionCount;
   
   
   
   
   
   
   public Long getOptionCount() {
	return optionCount;
	}
	public void setOptionCount(Long optionCount) {
		this.optionCount = optionCount;
	}
	public Long getOptionNum() {
	      return optionNum;
   }
   public void setOptionNum(Long optionNum) {
      this.optionNum = optionNum;
   }
   public String getOptionName() {
      return optionName;
   }
   public void setOptionName(String optionName) {
      this.optionName = optionName;
   }
   public Long getOptionPrice() {
      return optionPrice;
   }
   public void setOptionPrice(Long optionPrice) {
      this.optionPrice = optionPrice;
   }
   public Integer getOptionDiv() {
      return optionDiv;
   }
   public void setOptionDiv(Integer optionDiv) {
      this.optionDiv = optionDiv;
   }
   public Long getProductNum() {
      return productNum;
   }
   public void setProductNum(Long productNum) {
      this.productNum = productNum;
   }
}