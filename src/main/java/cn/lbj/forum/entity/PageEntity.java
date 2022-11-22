package cn.lbj.forum.entity;

import java.util.List;

/**
 * TODO 分页对象
 *  使用泛型为多种页面提供服务
 * @param <T>
 */
public class PageEntity<T> {

    private long totalCount;         // 总记录数
    private int  totalPage;         // 总页数
    private List<T> list;           // 每页的数据list集合
    private int currentPage;        // 当前页码
    private int rows;               // 每页显示的条数
    private int startRecord;        // 每页显示的起始的条数位置

    public PageEntity(){}

    public long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(long totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getStartRecord() {
        return startRecord;
    }

    public void setStartRecord(int startRecord) {
        this.startRecord = startRecord;
    }

    @Override
    public String toString() {
        return "PageEntity{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                ", startRecord=" + startRecord +
                '}';
    }
}
