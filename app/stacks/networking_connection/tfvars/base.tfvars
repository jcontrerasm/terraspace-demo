<%= depends_on('network') %>

service_ranges          = []
network                 = <%= output('network.network_id') %>
service                 = "servicenetworking.googleapis.com"
reserved_peering_ranges = []
