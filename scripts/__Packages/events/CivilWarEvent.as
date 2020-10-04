class events.CivilWarEvent extends events.Event
{
   function CivilWarEvent()
   {
      super();
      this.image = "militaryjetpic";
      this.title = _root.civilWarEventTitle;
      this.description = _root.civilWarEvDe;
      this.secDescription = _root.civilWarEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("civilwar");
   }
}
