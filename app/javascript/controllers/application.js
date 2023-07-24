import { Application } from "@hotwired/stimulus"
import Dropdown from 'stimulus-dropdown'
import Chart from 'stimulus-chartjs'
import Autocomplete from 'stimulus-autocomplete'

const application = Application.start()
application.register('dropdown', Dropdown)
application.register('chart', Chart)
application.register('autocomplete', Autocomplete)

application.debug = false
window.Stimulus   = application

export { application }
