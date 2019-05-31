package com.springbook.biz.board;

public class Criteria {
	private int page;
    private int perPageNum;
	private String searchCondition;
	private String searchKeyword;

	public Criteria() {
        this.page = 1;
        this.perPageNum = 10;
    }
	//처음 페이지번호 설정
    public void setPage(int page) {

        if (page <= 0) {
            this.page = 1;
            return;
        }

        this.page = page;
    }

    public int getPage() {
        return page;
    }
    //페이지 당 보여주는 마지막 번호 설정
    public void setPerPageNum(int perPageNum) {
        this.perPageNum = page*10;
    }
  
    public int getPerPageNum() {
        return this.perPageNum;
    }
    //페이지당 시작 row번호 설정
    public int getPageStart() {
        return (this.page - 1) * 10+1;
    }
    
    public String getSearchCondition() {
  		return searchCondition;
  	}

  	public void setSearchCondition(String searchCondition) {
  		this.searchCondition = searchCondition;
  	}

  	public String getSearchKeyword() {
  		return searchKeyword;
  	}

  	public void setSearchKeyword(String searchKeyword) {
  		this.searchKeyword = searchKeyword;
  	}
}
