<!--  Modal content for Create New -->
<div class="modal fade upload-package-modal" tabindex="-1" role="dialog" aria-labelledby="upload-modal-label" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="upload-modal-label">Upload New Package(s)</h4>
            </div>
            <div class="modal-body">
                <p>The package(s) are uploaded and processed on our local server through a secured http connection. Check out our documentation for a complete workflow overview.</p>
                <form class="package-upload-form">
                    <label for="package-name-input">Name</label>
                    <input type="text" class="package-name-input" id="package-name-input" placeholder="Default is zip filename" />
                    <input type="checkbox" class="prefix-checkbox" id="prefix-checkbox" />
                    <label for="prefix-checkbox">Add as prefix</label>
                    <input type="submit" id="package-submit" class="button pull-right" value="Upload" />
                    <div class="package-drop" id="filedrag">
                        <label for="package-upload-input">Drag and drop one or multiple zipped packages</label>
                        <input type="file" id="fileselect" name="fileselect[]" multiple="multiple" />
                    </div>
                </form>
                <div class="upload-queue">
                    <table class="table upload-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>ZIP Filename</th>
                            <th>Package Name</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody id="upload-table-body">

                        </tbody>
                    </table>
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>