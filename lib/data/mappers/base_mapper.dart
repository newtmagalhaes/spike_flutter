abstract interface class BaseMapper<appModel, internalModel> {
  appModel fromAPI(internalModel internal);

  internalModel toAPI(appModel external);
}

extension ListMapper<appModel, internalModel> on BaseMapper<appModel, internalModel> {
  List<appModel> fromAPIList(List<internalModel> l) => l.map(fromAPI).toList();

  List<internalModel> toAPIList(List<appModel> l) => l.map(toAPI).toList();
}
