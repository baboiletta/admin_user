// $(document).ready(function(){
//     $('.new_subject').each(function() {
//       $(this).validate({
//         // Define element for validation, pass class of form
//         errorClass: 'jquery-validation-error',
        
//         // If invalid, show error message in below, also use insertBefore()
//         errorPlacement: function (error, element) {
//           error.insertAfter(element);
//         },
    
//         // Define list of rules
//         rules: {
//           'name': {
//             required: true,
//             rangelength: [2, 10]
//           },
//           'visible': {
//             required: true,
//           }
//         },
    
//         // Define content of message
//         messages: {
//           'name': {
//             required: 'Name required.',
//             rangelength: 'Name invalid, length range form 2 to 10.'
//           },
//           'visible': {
//             required: 'Visible required.',
            
//           }
//         }
//       });
//     });