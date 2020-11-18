package kr.or.ddit.common.model;

public class PageVo {
	private int page;
	private int pageSize;

	// 인자가 없는 생성자
	public PageVo() {
			
	}
	 

	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", pageSize=" + pageSize + "]";
	}
	
	

	
	
}
