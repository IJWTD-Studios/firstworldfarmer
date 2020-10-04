class events.CornFailedEvent extends events.Event
{
   function CornFailedEvent()
   {
      super();
      this.image = "corn-failed-eventpic";
      this.title = _root.cornFailedEventTitle;
      this.description = _root.cornFailedEvDe;
      this.secDescription = _root.cornFailedEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("corn");
   }
}
