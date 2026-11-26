<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="ClientManagement.aspx.cs" Inherits="new_project.ClientManagement" %>

<asp:Content ID="ClientManagement" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-content">
        <div id="clientOverview">
            <h2>Client Management</h2>
            <hr class="sidebar-hr">
            
            <div class="ClientM-toolbar">
                <div class="toolbar-left">
                    <input type="text" id="searchClient" class="search-input" placeholder="Search Client..." onkeyup="filterClientCards(this.value)" />
                    <select id="filterStatus" class="filter-select">
                        <option value="all">All Status</option>
                        <option value="active">Active</option>
                        <option value="not-active">Not Active</option>
                    </select>
                </div>
                <div class="btn-right">
                    <button type="button" class="upload-btn" onclick="openUploadModal()">Upload </button>
                    <button type="button" class="add-newclient-btn" onclick="openNewClientModal()">+ Add New Client </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal-overlay" id="addClientModal">
        <div class="client-modal">
            <!-- Modal Header -->
            <div class="modal-header">
                <div>
                    <h2>Add New Client</h2>
                    <p>Enter the client's information below.</p>
                </div>

                <button type="button" class="modal-close" onclick="closeClientModal()">&times;</button>
            </div>
            <!-- Indicator / Notification Area -->
            <div id="clientFormIndicator" class="client-form-indicator">
            
            </div>
            <!-- Horizontal Tabs -->
            <div class="client-tabs">
                <button type="button" class="client-tab active"
                    onclick="showClientTab('basicTab', this)">
                    Basic Information
                </button>

                <button type="button" class="client-tab"
                    onclick="showClientTab('contactTab', this)">
                    Contact Details
                </button>

                <button type="button" class="client-tab"
                    onclick="showClientTab('addressTab', this)">
                    Address Information
                </button>

                <button type="button" class="client-tab"
                    onclick="showClientTab('arrangementTab', this)">
                    Client Arrangement
                </button>
            </div>
             <!-- Modal Body -->
            <div class="modal-body">
                 <!-- BASIC INFORMATION -->
                <div class="client-tab-content active" id="basicTab">

                    <div class="section-heading">
                        <h3>Basic Information</h3>
                        <p>Enter the client's basic identification details.</p>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Client Classification <span>*</span></label>
                            <select class="form-control">
                                <option value="">Select classification</option>
                                <option>Business</option>
                                <option>Individual</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Client Status</label>
                            <select class="form-control">
                                <option>Active</option>
                                <option>Inactive</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Company / Individual Name <span>*</span></label>
                        <input type="text" class="form-control" placeholder="Enter company or individual name">
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Trade Name</label>
                            <input type="text" class="form-control" placeholder="Enter trade name">
                        </div>

                        <div class="form-group">
                            <label>Tax Identification Number (TIN)</label>
                            <input type="text" class="form-control" placeholder="Enter TIN">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Business Registration Number</label>
                        <input type="text" class="form-control" placeholder="Enter registration number">
                    </div>
                </div>
                
                <div class="client-tab-content" id="contactTab">

                    <div class="section-heading">
                        <h3>Contact Details</h3>
                        <p>Provide the client's contact information.</p>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Contact Person <span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter contact person">
                        </div>

                        <div class="form-group">
                            <label>Position</label>
                            <input type="text" class="form-control" placeholder="Enter position">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Contact Number <span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter contact number">
                        </div>

                        <div class="form-group">
                            <label>Alternative Number</label>
                            <input type="text" class="form-control" placeholder="Enter alternative number">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" placeholder="Enter email address">
                    </div>

                </div>
            
                <!-- CONTACT DETAILS -->
                <div class="client-tab-content" id="Div1">

                    <div class="section-heading">
                        <h3>Contact Details</h3>
                        <p>Provide the client's contact information.</p>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Contact Person <span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter contact person">
                        </div>

                        <div class="form-group">
                            <label>Position</label>
                            <input type="text" class="form-control" placeholder="Enter position">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Contact Number <span>*</span></label>
                            <input type="text" class="form-control" placeholder="Enter contact number">
                        </div>

                        <div class="form-group">
                            <label>Alternative Number</label>
                            <input type="text" class="form-control" placeholder="Enter alternative number">
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" placeholder="Enter email address">
                    </div>

                </div>
                <!-- ADDRESS INFORMATION -->
                <div class="client-tab-content" id="addressTab">

                    <div class="section-heading">
                        <h3>Address Information</h3>
                        <p>Provide the client's business and billing addresses.</p>
                    </div> 

                    <div class="form-group">
                        <label>Business Address <span>*</span></label>
                        <textarea class="form-control" placeholder="Enter complete business address"></textarea>
                    </div>

                    <div class="same-address">
                        <input type="checkbox" id="sameBillingAddress">
                        <label for="sameBillingAddress">
                            Billing address is the same as business address
                        </label>
                    </div>

                    <div class="form-group">
                        <label>Billing Address</label>
                        <textarea class="form-control" placeholder="Enter complete billing address"></textarea>
                    </div>

                </div>
                <!-- CLIENT ARRANGEMENT -->
                <div class="client-tab-content" id="arrangementTab">

                    <div class="section-heading">
                        <h3>Client Arrangement</h3>
                        <p>Specify the client's relationship and business arrangement.</p>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Client Relationship</label>
                            <select class="form-control">
                                <option value="">Select relationship</option>
                                <option>New Client</option>
                                <option>Existing Client</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Engagement Type</label>
                            <select class="form-control">
                                <option value="">Select arrangement</option>
                                <option>One-time</option>
                                <option>Regular</option>
                                <option>Contractual</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Acquisition Source</label>
                        <select class="form-control">
                            <option value="">Select source</option>
                            <option>Direct</option>
                            <option>Referral</option>
                            <option>Agent / Broker</option>
                            <option>Other</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Remarks</label>
                        <textarea class="form-control" placeholder="Enter additional notes about the client"></textarea>
                    </div>

                </div>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">

                <button type="button" class="btn-cancel" onclick="closeClientModal()">Cancel</button>

                <div class="footer-actions">
                    <button type="button" class="btn-previous" id="previousClientTab" onclick="changeClientTab(-1)"> Previous </button>

                    <button type="button" class="btn-next" id="nextClientTab" onclick="changeClientTab(1)"> Next </button>

                    <button type="button" class="btn-save" id="saveClientButton" style="display:none;"> Save Client </button>
                </div>

            </div>
        </div>
    </div>
</asp:Content>