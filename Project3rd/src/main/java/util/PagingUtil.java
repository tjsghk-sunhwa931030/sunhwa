package util;

public class PagingUtil {
	public static String pagingImg(
			int totalRecordCount, int pageSize, int blockPage, int nowPage, String page) {
		
		String pagingStr = "";
		
		int totalPage = (int)(Math.ceil(((double)totalRecordCount/pageSize)));
		
		int intTemp = (((nowPage-1) / blockPage) * blockPage) + 1;
		
		if(intTemp != 1) {
			pagingStr += ""
					+ "<a class='page-link' href='"+page+"nowPage="+ (intTemp-blockPage)+"'>"
					+ "<li class=\"page-item\">이전</li></a>";
		}
		
		int blockCount = 1;
		while(blockCount<=blockPage && intTemp<=totalPage) {
			
			if(intTemp==nowPage) {
				pagingStr += "<a class='page-link' href='' ><li class=\"page-item\">"+intTemp+"</li></a>";
			}
			else {
				pagingStr += "<a class='page-link' href='"+page+"nowPage="+intTemp+"'><li class=\"page-item\">"+intTemp+"</li></a>";
			}
			intTemp++;
			blockCount++;
		}
		if(intTemp <= totalPage) {
			pagingStr += "<a class=\"page-link\" href='"+page+"nowPage="+intTemp+"'>"+"<li class=\"page-item\">다음</li></a>";
		}
		return pagingStr;
	}

	public static String pagingAjax(
			int totalRecordCount,
			int pageSize,
			int blockPage,
			int renowPage,
			String page) {
			
			String pagingStr = "";
			
			//1.전체페이지 구하기
			int totalPage = 
			(int)(Math.ceil(((double)totalRecordCount/pageSize)));
			
			/*2.현재페이지번호를 통해 이전 페이지블럭에
			해당하는 페이지를 구한다.
			*/
			int intTemp = 
				(((renowPage-1) / blockPage) * blockPage) + 1;

			
			//3.처음페이지 바로가기 & 이전페이지블럭 바로가기
			
				//첫번째 페이지 블럭에서는 출력되지 않음
				//두번째 페이지 블럭부터 출력됨.
				
				pagingStr += ""
					+ "<a class='page-link' href='javascript:paging("+(intTemp-blockPage)+");'><li class='page-item'>이전</li></a>";
			
					
			
			//페이지표시 제어를 위한 변수
			int blockCount = 1;
			/*
			4.페이지를 뿌려주는 로직 : blockPage의 수만큼 또는
				마지막페이지가 될때까지 페이지를 출력한다.
			*/
			while(blockCount<=blockPage && intTemp<=totalPage)
			{
				if(intTemp==renowPage) {
					pagingStr += "<a class='page-link'><li class='page-item'>"+intTemp+"</li></a>";
				}
				else {
					pagingStr += "<a class='page-link' href='javascript:paging("+intTemp+");'><li class='page-item'>"+intTemp+"</li></a>";
				}
				intTemp++;
				blockCount++;
			}
			
			//5.다음페이지블럭 & 마지막페이지 바로가기
			
				pagingStr += "<a class='page-link' href='javascript:paging("+intTemp+");'><li class='page-item'>다음</li></a>";
				
					
			return pagingStr;
		}
	
}







































