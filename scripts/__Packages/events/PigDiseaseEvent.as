class events.PigDiseaseEvent extends events.Event
{
   function PigDiseaseEvent()
   {
      super();
      this.image = "pig-disease-eventpic";
      this.title = _root.pigDiseaseEventTitle;
      this.description = _root.pigDiseaseEvDe;
      this.secDescription = _root.pigDiseaseEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("pig");
   }
}
