class events.RefugeesEvent extends events.Event
{
   function RefugeesEvent()
   {
      super();
      this.image = "refugees1pic";
      this.title = _root.refugeesEventTitle;
      this.description = _root.refugeesEvDe;
      this.secDescription = _root.refugeesEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("Livestock");
   }
}
