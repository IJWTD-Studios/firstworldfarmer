class events.GuerillasEvent extends events.Event
{
   function GuerillasEvent()
   {
      super();
      this;
      this.image = "guerillaspic";
      this.title = _root.guerillasEventTitle;
      this.description = _root.guerillasEvDe;
      this.secDescription = _root.guerillasEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("guerillas");
   }
}
