class events.CattleDiseaseEvent extends events.Event
{
   function CattleDiseaseEvent()
   {
      super();
      this.image = "carcasspic";
      this.title = _root.cattleDiseaseEventTitle;
      this.description = _root.cattleDiseaseEvDe;
      this.secDescription = _root.cattleDiseaseEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("cow");
   }
}
