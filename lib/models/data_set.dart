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

  DataSet({this.id, this.datasetId, this.name, this.createdDate, this.updatedDate, this.relevanceDate, this.metaUrl, this.headerUrl, this.dataUrl});
}