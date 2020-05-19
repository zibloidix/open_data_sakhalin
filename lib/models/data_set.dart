class DataSet {
  bool isSelected = false;
  String id;
  String name;
  String datasetId;
  String headerUrl;
  String dataUrl;
  String metaUrl;
  String createdDate;
  String updatedDate;
  String relevanceDate;
  int viewCount;
  int downloadCount;

  DataSet({
    this.id, 
    this.datasetId, 
    this.name, 
    this.createdDate, 
    this.updatedDate, 
    this.relevanceDate, 
    this.metaUrl, 
    this.headerUrl, 
    this.dataUrl, 
    this.viewCount, 
    this.downloadCount
  });

  DataSet.copyFrom(DataSet dataSet) {
    id = dataSet.id;
    datasetId = dataSet.datasetId;
    name = dataSet.name; 
    createdDate = dataSet.createdDate; 
    updatedDate = dataSet.updatedDate; 
    relevanceDate = dataSet.relevanceDate; 
    metaUrl = dataSet.metaUrl; 
    headerUrl = dataSet.headerUrl; 
    dataUrl = dataSet.dataUrl; 
    viewCount = dataSet.viewCount; 
    downloadCount = dataSet.downloadCount;
  }
}