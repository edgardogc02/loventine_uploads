# README

This was the service in charge of uploading and displaying photos for Loventine (https://www.loventine.com). *Loventine was a dating website and is discontinued as of March 2020.*

#### For uploading pictures there were many posibilities:
* Classic upload (with site reload)
* Upload using Ajax
* Importing images from Facebook
* Taking picture with webcam

#### Requirements: 
* Users can have only one avatar
* Users can have many album photos
* Photos must only be in jpeg, png or bmp format
* Photos must maintain great quality and be as light as possible 
* Photos must have thumbnails in different sizes
* Photos have different states. Initial state is *pending*. Only *approved* photos are displayed to all users. 
* User can see all his uploaded photos, independent of the photo state.
* User should be able to center and crop the original photo as much as he/she wants. This should also regenerate the thumbnails if they already exist
* Uploads must be fast and safe
** This is why the photo is uploaded first to the server and then in a background process is saved to s3. (Uploading directly to s3 was way slower).
