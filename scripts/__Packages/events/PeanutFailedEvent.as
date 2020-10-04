class events.PeanutFailedEvent extends events.Event
{
   function PeanutFailedEvent()
   {
      super();
      this;
      this.image = "peanut-failed-eventpic";
      this.title = _root.peanutFailedEventTitle;
      this.description = _root.peanutFailedEvDe;
      this.secDescription = _root.peanutFailedEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("peanut");
   }
}
