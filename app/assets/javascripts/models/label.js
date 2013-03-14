Nomadpm.Label = DS.Model.extend({
  name: DS.attr('string'),
  slug: DS.attr('string'),
  labelable: DS.attr('references')
});