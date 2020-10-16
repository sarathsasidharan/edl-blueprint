# Data Preparation 

This section represents how the data is moved from the raw delivery zone to downstream data zones where data is cleaned and made ready for consumption.

This is the second logical block in our data lake layer , which picks up data from the raw delivery zone and performs :

- Technical Data Quality Checks
- Basic Transformations and Normalization as requried by the organization
- Coversion to a Common Data Model , if the organization has opted for this


The Basic Flow is that the data is being pumped in from disperate sources both batch and streaming and this layer picks it up and performs operations listed above and gets it delivered into the exposure / consumption layer.

![picture](docs/images/dataprep.PNG)
