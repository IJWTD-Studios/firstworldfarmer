class events.WheatFailedEvent extends events.Event
{
   function WheatFailedEvent()
   {
      super();
      this.image = "wheat-failed-eventpic";
      this.title = _root.wheatFailedEventTitle;
      this.description = _root.wheatFailedEvDe;
      this.secDescription = _root.wheatFailedEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("wheat");
   }
}
